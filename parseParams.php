<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */
function doParseParams($params) {
  extract($params);

  $xml = simplexml_load_file("{target}") or die("Error: Cannot create object");
  $fields = $xml->field;
  $replaceParams = 
  "| Name | Type | Description | Create Rule |
| ---- | ---- | ---- | ---- |";

  foreach($fields as $field) {
    if($field->name == 'id') {
        continue;
    }
    $create_rule = '';
    if(property_exists($field, 'required') && 
      ($field->required == true && !property_exists($field, 'default'))
    ) {
        $create_rule = 'required';
    }
    // $description = shell_exec('drush ev');
    $row = '| ' . $field->name . ' | ' . $field->type . ' | ' . $field->comment . ' | ' . $create_rule . ' |';
    $replaceParams = $replaceParams . "\n" . $row;
  }

  $search = "{{PARAMS}}";
  $content = str_replace($search, $replaceParams, $content);

  $params['content'] = $content;
  return $params;
}