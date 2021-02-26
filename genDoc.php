<?php

class genDoc {
  function __construct($entityName) {
    $genDocDir = __DIR__;
    $markdownDir = $genDocDir."/markdown";
    $baseDir = dirname($genDocDir);
    $filePath = $markdownDir."/".$entityName.".md";

    $params = array(
      'entityName' => $entityName,
      'genDocDir' => $genDocDir,
      'markdownDir' => $markdownDir,
      'baseDir' => $baseDir,
      'filePath' => $filePath,
    );

    # 1. Prepare each parameters, files.
    if (!is_dir($markdownDir)) {
      mkdir($markdownDir);
    }

    $content = "# $entityName

{{DESC}}

{{PARAMS}}

{{SAMPLE_CODE}}

{{RESULT}}

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

    $file = fopen($filePath, "w");
    fwrite($file, $params['content']);
    fclose($file);

  }
}

if (!empty($argv[1])) {
  $entityName = $argv[1];
  new genDoc($entityName);
}