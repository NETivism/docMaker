<?php

include_once("translateFromTpl.php");

class genDoc {
  function __construct($entityName) {
    $genDocDir = __DIR__;
    $markdownDir = $genDocDir."/markdown";
    $templatesDir = $genDocDir."/templates";
    $baseDir = dirname($genDocDir);
    $markdownFilePath = $markdownDir."/".$entityName.".md";
    $templatesFilePath = $templatesDir."/".$entityName.".tpl";

    $params = array(
      'entityName' => $entityName,
      'genDocDir' => $genDocDir,
      'markdownDir' => $markdownDir,
      'baseDir' => $baseDir,
      'markdownFilePath' => $markdownFilePath,
      'templatesDir' => $templatesDir,
      'templatesFilePath' => $templatesFilePath
    );

    # 1. Prepare each parameters, files.
    if (!is_dir($markdownDir)) {
      mkdir($markdownDir);
    }

    $content = "# $entityName

{{DESC}}

{{PARAMS}}

{literal}
{{SAMPLE_CODE}}

{{RESULT}}
{/literal}

";
    $params['content'] = $content;

    # 2. Parse description from comments of API file
    include_once("parseDesc.php");
    $params = doParseDesc($params);

    # 3. Parse available parameters from xml
    include_once("parseParams.php");
    $params = doParseParams($params);

    # 4. Get Sample Code from API test file
    include_once("genSampleCode.php");
    $params = doGenSampleCode($params);

    # 5. Get Result from executing phpunit testing by Sample Code
    include_once("genTestResult.php");
    $params = doGenTestResult($params);

    # 6. Generate html file from markdown file
    include_once("genHtmlFromMD.php");
    $params = doGenHtmlFromMD($params);

    # Save as tpl file
    $file = fopen($templatesFilePath, "w");
    fwrite($file, $params['content']);
    fclose($file);

    # Translate tpl file using smarty
    $params = doTranslate($params);

    # Save as markdown file
    $file = fopen($markdownFilePath, "w");
    fwrite($file, $params['content']);
    fclose($file);

  }
}

if (!empty($argv[1])) {
  $entityName = $argv[1];
  new genDoc($entityName);
}