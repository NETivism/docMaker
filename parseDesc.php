<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */

/**
 * @start_document
 * # Title 1
 * ## Title 2
 * jasdkfj
 * sdfs
 * ### Title 3
 * @end_document
 */

function doParseDesc($params) {
  extract($params);

  $fileName = $baseDir .'/api/v3/'.$entityName.'.php';

  $docComments = array_filter(
    token_get_all( file_get_contents( $fileName ) ), function($entry) {
        return $entry[0] == T_DOC_COMMENT;
    }
  );

  $replaceDesc = "";
  foreach($docComments as $comments) {
    $fileDocComment = $comments[1];
    $fileDocComment = trim($fileDocComment, '/**');
    $fileDocComment = str_replace(' * ', '', $fileDocComment);
    preg_match('#@start_document(.+)@end_document#s',$fileDocComment,$matches);
    if (!empty($matches[1])) {
      $replaceDesc = $replaceDesc . $matches[1];
    }
  }

  $search = "{{DESC}}";
  $content = str_replace($search, $replaceDesc, $content);

  $params['content'] = $content;
  return $params;
}