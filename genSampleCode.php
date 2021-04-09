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
    $fileDocComment = str_replace('   * ', '', $fileDocComment);
    preg_match('#@start_document(.+)@end_document#s',$fileDocComment,$matches);
    $description = $matches[1];


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
    $unitTestResultFileDir = $baseDir.'/docMaker/unit_test_results/'.$funcName.'Result.json';
    $unitTestResultFile = fopen($unitTestResultFileDir, 'r');
    $unitTestResult = fread($unitTestResultFile, filesize($unitTestResultFileDir));
    fclose($unitTestResultFile);

    // preserve \{ and \}
    $description = str_replace("\{", "{literal}\{{/literal}", $description);
    $description = str_replace("\}", "{literal}\}{/literal}", $description);

    // transfer result json to obj
    $resultObj = json_decode($unitTestResult, TRUE);
    $value = reset($resultObj['values']);
    genDoc::$_smarty->assign('value', $value);

    // transfer result json to json code block
    $unitTestResultText = "**{ts}Response Samples{/ts}** \r\n{literal}```json\r\n" . $unitTestResult . "\r\n```{/literal}";
    genDoc::$_smarty->assign('result', $unitTestResultText);
    $filePath = $templatesDir.'/'.$funcName.'.tpl';
    $tplFile = fopen($filePath, 'w');
    fwrite($tplFile, $description);
    fclose($tplFile);
    $fetchResult = genDoc::$_smarty->fetch($filePath);
    $replaceDesc .= $fetchResult;
  }

  // preserve \{ and \}
  $replaceDesc = str_replace("\{", "{literal}{{/literal}", $replaceDesc);
  $replaceDesc = str_replace("\}", "{literal}}{/literal}", $replaceDesc);

  $search = "{{SAMPLE_CODE}}";
  $content = str_replace($search, $replaceDesc, $content);
  $params['content'] = $content;

  // // Get Function name for Sample code.
  // $funcNames = array();
  // foreach($docComments as $order => $commentBlock) {
  //   global $nextLine;
  //   $nextLine = $docBlocks[$order+2][2];
  //   $funcNameBlocks = array_filter(
  //     $docBlocks, function($entry) {
  //       global $nextLine;
  //       return $entry[2] == $nextLine && $entry[0] == T_STRING;
  //     }
  //   );
  //   $funcNameBlock = reset($funcNameBlocks);
  //   $funcNames[] = $funcNameBlock[1];
  // }
  // $params['testFunctions'] = $funcNames;

  return $params;
}