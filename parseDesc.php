<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */
function doParseDesc($params) {
  extract($params);
  print($entityName);
  print("\n");
  print($baseDir);
  print("\n");
  print($content);
  print("\n");

  $replaceDesc = "This is description...";
  $search = "{{DESC}}";
  $content = str_replace($search, $replaceDesc, $content);

  $params['content'] = $content;
  return $params;
}