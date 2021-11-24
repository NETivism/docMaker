<?php
require_once '../civicrm.config.php';

function doTranslate($params){
    if (genDoc::$_smarty) {
        $smarty = genDoc::$_smarty;
    }
    else {
        $smarty = prepareSmarty($params);
    }

    $result = $smarty->fetch($params['templatesFilePath']);
    $params['content'] = $result;
    return $params;
}

function prepareSmarty($params) {
    chdir(__DIR__);

    require_once 'Smarty/Smarty.class.php';
    require_once 'CRM/Core/Smarty/resources/String.php';
    require_once 'CRM/Core/Smarty/plugins/block.localize.php';
    $smarty = new Smarty();
    $smarty->template_dir = $params['templatesDir'];
    $smarty->plugins_dir = array('../packages/Smarty/plugins', '../CRM/Core/Smarty/plugins');
    $smarty->compile_dir = createTempDir();
    $smarty->clear_all_cache();

    $smarty->register_block('localize', 'smarty_block_localize');

    $smarty->assign('locale', 'en');
    $smarty->assign('tsLocale', 'zh-TW');

    $smarty->register_resource('string', array(
        'civicrm_smarty_resource_string_get_template',
        'civicrm_smarty_resource_string_get_timestamp',
        'civicrm_smarty_resource_string_get_secure',
        'civicrm_smarty_resource_string_get_trusted',
      )
    );
    return $smarty;
}

function prepareLocalTranslate() {
  $strings = array(
    'Request Example' => '傳送範例',
    'Response Example' => '回傳範例',
  );
  return array(
    'zh_TW'=> array(
      'enabled' => array(
        'exactMatch' => $strings,
      ),
    ),
  );
}


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