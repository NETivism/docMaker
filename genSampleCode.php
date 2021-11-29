<?php
/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */
function doGenSampleCode($params) {
  extract($params);

  try {
    genDoc::$_smarty->assign('API_KEY_HEADER', "--header 'x-civicrm-api-key: <secret-key>'");
    genDoc::$_smarty->assign('SITE_KEY_HEADER', "--header 'x-civicrm-site-key: <site-key>'");
  }
  catch (Exception $e) {
    print('genDoc::$_smarty has error.');
  }


  $baseTpl = $params['templatesDir'].'/apiItem.tpl';
  $fileName = $baseDir.'/tests/phpunit/api/v3/'.$entityName.'Test.php';

  $docBlocks = token_get_all( file_get_contents( $fileName ) );
  $docComments = array_filter(
    $docBlocks, function($entry) {
        return $entry[0] == T_DOC_COMMENT;
    }
  );

  // Get sample code description.
  $replaceDesc = "";
  foreach($docComments as $order => $comments) {
    $fileDocComment = $comments[1];
    $fileDocComment = trim($fileDocComment, '/**');
    $fileDocComment = preg_replace('/^\s+\*[ ]*/m', '', $fileDocComment);
    preg_match('#@docmaker_start(.+)@docmaker_end#s', $fileDocComment, $matches);
    if (empty($matches)) {
      continue;
    }
    $description = $matches[1];
    $lines = explode("\n", $description);

    // iterate each line to parse smarty by string
    $tplParams = array();
    foreach($lines as $line) {
      preg_match('/^@(\w+)\s+(.*)$/', $line, $matches);
      if (!empty($matches)) {
        $tplParams[$matches[1]] = 'string:'.$matches[2];
      }
    }

    // get function name and replace {{Result}} with unit test result.
    global $nextLine;
    $nextLine = $docBlocks[$order+2][2];
    $funcNameBlocks = array_filter(
      $docBlocks, function($entry) {
        global $nextLine;
        return $entry[2] == $nextLine && $entry[0] == T_STRING;
      }
    );
    $funcNameBlock = reset($funcNameBlocks);
    $funcName = $funcNameBlock[1];

    // Load Funcname json
    $unitTestRequest = file_get_contents($baseDir.'/docMaker/unit_test_results/'.$entityName."Test_".$funcName.'-request.json');
    $unitTestResponse = file_get_contents($baseDir.'/docMaker/unit_test_results/'.$entityName."Test_".$funcName.'-response.json');
    genDoc::$_smarty->assign('request_body', json_encode(json_decode($unitTestRequest), JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    genDoc::$_smarty->assign('response_body', json_encode(json_decode($unitTestResponse), JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    genDoc::$_smarty->assign('request_body_inline', json_encode(json_decode($unitTestRequest), JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
    genDoc::$_smarty->assign('response_body_inline', json_encode(json_decode($unitTestResponse), JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
    foreach($tplParams as $varName => $val) {
      genDoc::$_smarty->assign($varName, genDoc::$_smarty->fetch($val));
    }

    // transfer result json to obj
    // $resultObj = json_decode($unitTestRequest, TRUE);
    // $value = reset($resultObj['values']);
    // genDoc::$_smarty->assign('value', $value);

    // transfer result json to json code block
    $fetchResult = genDoc::$_smarty->fetch($baseTpl);
    $replaceDesc .= $fetchResult."\n";
    genDoc::$_smarty->clear_all_assign();
  }

  // preserve \{ and \}
  $replaceDesc = str_replace("\{", "{literal}{{/literal}", $replaceDesc);
  $replaceDesc = str_replace("\}", "{literal}}{/literal}", $replaceDesc);

  $search = "@SAMPLE_CODE@";
  $content = str_replace($search, $replaceDesc, $content);
  $params['content'] = $content;

  return $params;
}