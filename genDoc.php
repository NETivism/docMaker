<?php

include_once("translateFromTpl.php"); // it needs to be place here

class genDoc {
  static public $_smarty = NULL;

  function __construct($entityName) {
    $params = array(
      'entityName' => $entityName,
      'genDocDir' => __DIR__,
      'markdownDir' => __DIR__."/content/docs/3",
      'baseDir' => dirname(__DIR__),
      'templatesDir' => __DIR__."/templates",
      'markdownFilePath' => __DIR__."/content/docs/3/".$entityName.'.md',
      'templatesFilePath' => __DIR__."/templates/".$entityName.".tpl",
    );

    # 1. Prepare each parameters, files.
    if (!is_dir($params['markdownDir'])) {
      mkdir($params['markdownDir']);
    }

    $content = "# $entityName API

{{DESC}}

{{PARAMS}}

{{SAMPLE_CODE}}
";
    $params['content'] = $content;

    # 2. Parse description from comments of API file
    include_once("parseDesc.php");
    $params = doParseDesc($params);

    # 3. Parse available parameters from xml
    include_once("parseParams.php");
    $params = doParseParams($params);

    genDoc::$_smarty = prepareSmarty($params);

    # 4. Get Sample Code from API test file
    include_once("genSampleCode.php");
    $params = doGenSampleCode($params);

    # 6. Generate html file from markdown file
    include_once("genHtmlFromMD.php");
    $params = doGenHtmlFromMD($params);

    # Save as tpl file
    $file = fopen($params['templatesFilePath'], "w");
    fwrite($file, $params['content']);
    fclose($file);

    # Translate tpl file using smarty
    $params = doTranslate($params);

    # Save as markdown file
    $file = fopen($params['markdownFilePath'], "w");
    fwrite($file, $params['content']);
    fclose($file);

  }
}

if (!empty($argv[1])) {
  $entityName = $argv[1];
  new genDoc($entityName);
}