<?php
// ini_set('display_errors',"1");
/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */
function doGenSampleCode($params) {
  extract($params);

  $tokenMapping = array(
    "{{API_KEY_HEADER}}" => "--header 'x-civicrm-api-key: <secret-key>'",
    "{{SITE_KEY_HEADER}}" => "--header 'x-civicrm-site-key: <site-key>'"
  );

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
    $fileDocComment = str_replace(' * ', '', $fileDocComment);
    preg_match('#@start_document(.+)@end_document#s',$fileDocComment,$matches);
    $description = $matches[1];
    foreach($tokenMapping as $token => $replacement) {
      $description = str_replace($token, $replacement, $description);
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
    $unitTestResultFileDir = $baseDir.'/docMaker/unit_test_results/'.$funcName.'Result.json';
    $unitTestResultFile = fopen($unitTestResultFileDir, 'r');
    $unitTestResult = fread($unitTestResultFile, filesize($unitTestResultFileDir));
    fclose($unitTestResultFile);
    $unitTestResult = "{literal}".$unitTestResult."{/literal}";
    $description = str_replace("{{RESULT}}", $unitTestResult, $description);
    $replaceDesc = $replaceDesc . $description;
  }

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