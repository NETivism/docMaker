<?php

/**
 * in $params
 *   $entityName => entity name like "contact", "email"
 *   $baseDir => Directory path to base civicrm, like "/path/to/civicrm"
 *   $content => current full doc content
 */
function doGenTestResult($params) {
  extract($params);

  // if ($testFunctions) {
  //   foreach ($testFunctions as $functionName) {
  //     chdir($baseDir.'/tests/phpunit');
  //     shell_exec("phpunit --filter '/::{$functionName}$/' \"api/v3/{$entityName}Test.php\"");
  //   }
  // }

  return $params;
}