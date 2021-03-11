<?php
echo __DIR__;
require_once '../civicrm.config.php';
$config   = CRM_Core_Config::singleton();
chdir(__DIR__);

require_once 'Smarty/Smarty.class.php';
$smarty = new Smarty();
$smarty->template_dir = './templates';
$smarty->plugins_dir = array('../packages/Smarty/plugins', '../CRM/Core/Smarty/plugins');
$smarty->compile_dir = createTempDir();
$smarty->clear_all_cache();

require_once 'CRM/Core/Smarty/plugins/block.localize.php';
$smarty->register_block('localize', 'smarty_block_localize');

$smarty->assign('locale', 'en');
$smarty->assign('tsLocale', 'zh-TW');

$result = $smarty->fetch('Email.tpl');

echo "123123";
echo $result;

function createTempDir($prefix = '') {
  if (isset($_SERVER['TMPDIR'])) {
    $tempDir = $_SERVER['TMPDIR'];
  }
  else {
    $tempDir = '/tmp';
  }

  $newTempDir = $tempDir . '/' . $prefix . rand(1, 10000);

  if (file_exists($newTempDir)) {
    removeDir($newTempDir);
  }
  createDir($newTempDir);

  return $newTempDir;
}

function removeDir($dir) {
  foreach (glob("$dir/*") as $tempFile) {
    unlink($tempFile);
  }
  rmdir($dir);
}

function createDir($dir, $perm = 0755) {
  if (!is_dir($dir)) {
    mkdir($dir, $perm, TRUE);
  }
}
