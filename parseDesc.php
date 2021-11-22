<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */

/**
 * @docmaker_start
 * # Title 1
 * ## Title 2
 * jasdkfj
 * sdfs
 * ### Title 3
 * @docmaker_end
 */

function doParseDesc($params) {
  extract($params);

  $fileName = $baseDir .'/tests/phpunit/api/v3/'.$entityName.'Test.php';

  $docComments = array_filter(
    token_get_all( file_get_contents( $fileName ) ), function($entry) {
        return $entry[0] == T_DOC_COMMENT;
    }
  );

  $replaceDesc = "";
  foreach($docComments as $comments) {
    $fileDocComment = $comments[1];
    $fileDocComment = trim($fileDocComment, '/**');
    $fileDocComment = preg_replace('/^\s+\*[ ]*/m', '', $fileDocComment);
    preg_match('#@docmaker_intro_start(.+)@docmaker_intro_end#s', $fileDocComment, $matches);
    if (!empty($matches[1])) {
      $replaceDesc = $replaceDesc . $matches[1];
    }
  }

  $search = "{{DESC}}";
  $content = str_replace($search, $replaceDesc, $content);

  $params['content'] = $content;
  return $params;
}