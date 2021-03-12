<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */
function doGenSampleCode($params) {
  extract($params);

  $fileName = $baseDir.'/tests/phpunit/api/v3/'.$entityName.'Test.php';

  // Get Function name for Sample code.
  $docBlocks = token_get_all( file_get_contents( $fileName ) );
  $docComments = array_filter(
    $docBlocks, function($entry) {
        return $entry[0] == T_DOC_COMMENT;
    }
  );

  $funcNames = array();
  foreach($docComments as $order => $commentBlock) {
    global $nextLine;
    $nextLine = $docBlocks[$order+2][2];
    $funcNameBlocks = array_filter(
      $docBlocks, function($entry) {
        global $nextLine;
        return $entry[2] == $nextLine && $entry[0] == T_STRING;
      }
    );
    $funcNameBlock = reset($funcNameBlocks);
    $funcNames[] = $funcNameBlock[1];
  }
  $params['testFunctions'] = $funcNames;

  return $params;
}