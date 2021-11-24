<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */


function doParseParams($params) {
  chdir(__DIR__);
  # mapping type to the string that existing in civicrm.po
  $type_mapping = array(
    'varchar' => 'String',
    'char' => 'String',
    'text' => 'String',
    'longtext' => 'String',
    'datetime' => 'Date',
    'date' => 'Date',
    'int unsigned' => 'Number',
    'int' => 'Number',
    'enum' => 'String',
    'decimal' => 'Number',
    'boolean' => 'Boolean',
    'float' => 'Float'
  );

  extract($params);
  $xmlFolder = $baseDir .'/xml/schema/';
  $filePathArray = glob($xmlFolder.'*/'.$entityName.'.xml');
  $file = reset($filePathArray);
  print $file;

  $xml = simplexml_load_file("$file") or die("Error: Cannot create object");
  $replaceParams = 
  "| {ts}Parameter Name{/ts} | {ts}Type{/ts} | {ts}Length{/ts} | {ts}Format{/ts} | {ts}Create Rule{/ts} | {ts}Field Help{/ts} |
| ---- | ---- | ---- | ---- | ---- | ---- |";

  $fieldsArray = array();

  // Some field appear twice in XML files. Compare the 'Add' attribute.
  foreach($xml->field as $field) {
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

    $comment = '';
    if(property_exists($field, 'comment')) {
      $comment = '{ts}'.(string) $field->comment.'{/ts}';
    }

    $type = '';
    if(property_exists($field, 'type')) {
      $origin_type = (string) $field->type;
      if(array_key_exists($origin_type, $type_mapping)) {
        $type = '{ts}' . $type_mapping[$origin_type] . '{/ts}'."($origin_type)";
      }
      else if($origin_type == 'boolean') {
        $type = '{ts}Boolean{/ts}'."($origin_type)";
      }
      else {
        $type = $origin_type;
      }
    }

    $length = NULL;
    if ($origin_type) {
      if (property_exists($field, 'length')) {
        $length = (int)$field->length;
      }
      else {
        $origin_type = (string) $field->type;
        switch($origin_type) {
          case 'varchar':
            $length = 255;
            break;
          case 'char':
            $length = 1;
            break;
          case 'int':
          case 'int unsigned':
            $length = 10;
            break;
          case 'decimal':
            $length = '20,2';
            break;
          case 'boolean':
            $length = 1;
            break;
          case 'text':
          case 'longtext':
            $length = 65535;
            break;
          default:
            $length = '';
            break;
        }
      }
    }

    $format = '';
    if ($origin_type) {
      switch($origin_type) {
        case 'enum':
          if (property_exists($field, 'values')) {
            $format = (string) $field->values;
          }
          break;
        case 'boolean':
          $format = '0 or 1';
          break;
        case 'int unsigned':
          $format = '>= 0';
          break;
        case 'datetime':
          $format = 'yyyy-mm-dd hh:ii:ss';
          break;
        case 'date':
          $format = 'yyyy-mm-dd';
          break;
        case 'decimal':
        case 'float':
          $format = '00.00';
          break;
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

    $row = '| ' . $field->name . ' | ' . $type . ' | '. $length .' | ' . $format .' | ' . $create_rule . ' | ' . $comment. ' |';
    $replaceParams = $replaceParams . "\n" . $row;
  }
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
