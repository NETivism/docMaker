<?php

include_once("translateFromTpl.php"); // it needs to be place here

class genDoc {
  static public $_smarty = NULL;

  function __construct($entityName, $phase = NULl) {
    $config   = CRM_Core_Config::singleton();
    $i18n = CRM_Core_I18n::Singleton();
    $i18n->_localeCustomStrings =  prepareLocalTranslate();
    $params = array(
      'entityName' => $entityName,
      'genDocDir' => __DIR__,
      'markdownDir' => __DIR__."/content/3",
      'baseDir' => dirname(__DIR__),
      'templatesDir' => __DIR__."/templates",
      'markdownFilePath' => __DIR__."/content/3/".$entityName.'.md',
      'templatesFilePath' => __DIR__."/templates/".$entityName.".tpl",
    );
    genDoc::$_smarty = prepareSmarty($params);

    # 1. Prepare each parameters, files.
    if (!is_dir($params['markdownDir'])) {
      mkdir($params['markdownDir']);
    }

    // check https://learn.netlify.app/en/cont/pages/#front-matter-configuration for fomatting
    $content = <<<'TEXTBLOCK'
+++
title = "{$api_title} API"
menuTitle = "{$api_title}"
chapter = false
+++
@DESC@

@PARAMS@

@SAMPLE_CODE@
TEXTBLOCK;
    $params['content'] = $content;

    if (!$phase || $phase === 'desc') {
      # 2. Parse description from comments of API file
      include_once("parseDesc.php");
      $params = doParseDesc($params);
    }

    # 3. Parse available parameters from xml
    if (!$phase || $phase === 'params') {
      include_once("parseParams.php");
      $params = doParseParams($params);
    }

    # 4. Get Sample Code from API test file
    if (!$phase || $phase === 'sample') {
      include_once("genSampleCode.php");
      $params = doGenSampleCode($params);
    }

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
  if (!empty($argv[2])) {
    new genDoc($argv[1], $argv[2]);
  }
  else {
    new genDoc($argv[1]);
  }
}