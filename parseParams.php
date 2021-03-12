<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */


function doParseParams($params) {
  # mapping type to the string that existing in civicrm.po
  $TYPE_MAPPING = array(
    'varchar' => 'String',
    'char' => 'String',
    'text' => 'String',
    'longtext' => 'String',
    'datetime' => 'Date',
    'date' => 'Date',
    'int unsigned' => 'Number',
    'int' => 'Number',
    'enum' => 'Number',
    'decimal' => 'Number',
    'boolean' => 'Boolean',
    'float' => 'Float'
  );

  extract($params);
  $xmlFolder = $baseDir .'/xml/schema/';
  $filePathArray = glob($xmlFolder.'*/'.$entityName.'.xml');
  $file = reset($filePathArray);

  $xml = simplexml_load_file("$file") or die("Error: Cannot create object");
  $fields = $xml->field;
  $replaceParams = 
  "| {ts}Name{/ts} | {ts}Type{/ts} | {ts}Description{/ts} | {ts}Create Rule{/ts} |
| ---- | ---- | ---- | ---- |";

  foreach($fields as $field) {
    if($field->name == 'id') {
        continue;
    }

    $name = composeTitle($field->name);
    if($name == '') {
        $name = $field->name;
    } else {
        $name = '{ts}' . $name . '{/ts}';
    }

    $type = '';
    if(property_exists($field, 'type')) {
      $origin_type = (string) $field->type;
      if(array_key_exists($origin_type, $TYPE_MAPPING)) {
        $type = '{ts}' . $TYPE_MAPPING[$origin_type] . '{/ts}';
      } else {
        $type = $origin_type;
      }
    }

    $description = '';
    if(property_exists($field, 'title')) {
      $description = '{ts}' . $field->title . '{/ts}';
    }
    
    $create_rule = '';
    if(property_exists($field, 'required') && 
      ($field->required == true && !property_exists($field, 'default'))
    ) {
        $create_rule = '{ts}required{/ts}';
    }


    // $description = shell_exec('drush ev');
    $row = '| ' . $name . ' | ' . $type . ' | ' . $description . ' | ' . $create_rule . ' |';
    $replaceParams = $replaceParams . "\n" . $row;
  }

  $search = "{{PARAMS}}";
  $content = str_replace($search, $replaceParams, $content);

  $params['content'] = $content;
  return $params;
}

function composeTitle($name) {
    $names = explode('_', strtolower($name));
    $title = '';
    for ($i = 0; $i < count($names); $i++) {
      if ($names[$i] === 'id' || $names[$i] === 'is') {
        // id's do not get titles
        return NULL;
      }

      if ($names[$i] === 'im') {
        $names[$i] = 'IM';
      }
      else {
        $names[$i] = ucfirst(trim($names[$i]));
      }

      $title = $title . ' ' . $names[$i];
    }
    return trim($title);
}
