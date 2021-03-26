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
    'float' => 'Float'
  );

  extract($params);
  $xmlFolder = $baseDir .'/xml/schema/';
  $filePathArray = glob($xmlFolder.'*/'.$entityName.'.xml');
  $file = reset($filePathArray);

  $xml = simplexml_load_file("$file") or die("Error: Cannot create object");
  $fields = $xml->field;
  $replaceParams = 
  "| {ts}Parameter Name{/ts} | {ts}Field Help{/ts} | {ts}Type{/ts} | {ts}Create Rule{/ts} |
| ---- | ---- | ---- | ---- |";

  $fieldsArray = array();

  // Some field appear twice in XML files. Compare the 'Add' attribute.
  foreach($fields as $field) {
    if (isset($fieldsArray[$field->name])) {
      $newVersion = (Float) $field->add;
      $originVersion = (Float) $fieldsArray[$field->name]->add;
      if ($newVersion > $originVersion) {
        $fieldsArray[(String) $field->name] = $field;
      }
    }
    else {
      $fieldsArray[(String) $field->name] = $field;
    }
  }
  foreach ($fieldsArray as $field) {
    if($field->name == 'id') {
        continue;
    }

    $name = composeTitle($field->name);
    if($name == '') {
        $name = $field->name;
    }
    else if(property_exists($field, 'title')) {
      $name = '{ts}' . $field->title . '{/ts}';
    }
    else {
        $name = '{ts}' . $name . '{/ts}';
    }

    $type = '';
    if(property_exists($field, 'type')) {
      $origin_type = (string) $field->type;
      if(array_key_exists($origin_type, $TYPE_MAPPING)) {
        $type = '{ts}' . $TYPE_MAPPING[$origin_type] . '{/ts}';
      } else if($origin_type == 'boolean') {
        $type = '{ts}Boolean{/ts}({ts}True or False{/ts})';
      } else {
        $type = $origin_type;
      }
    }

    $create_rule = array();
    if(property_exists($field, 'required') && $field->required == 'true') {
        $create_rule[] = '{ts}Required{/ts}';
    }
    if (property_exists($field, 'default')) {
      $create_rule[] = "{ts}Default Value{/ts}: {$field->default}";
    }
    $create_rule = implode(', ', $create_rule);

    $row = '| ' . $field->name . ' | ' . $name . ' | ' . $type . ' | ' . $create_rule . ' |';
    $replaceParams = $replaceParams . "\n" . $row;
  }
  print_r($row);
  // $replaceParams = $replaceParams . "\n" . implode("\n", $row);

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
        continue;
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
