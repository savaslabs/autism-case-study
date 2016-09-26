<?php
/**
 * @file
 * block_latest_content.features.fe_block_settings.inc
 */

/**
 * Implements hook_default_fe_block_settings().
 */
function block_latest_content_default_fe_block_settings() {
  $export = array();

  $export['version'] = '2.0';

  $export['views-latest_content-block_1'] = array(
    'cache' => -1,
    'custom' => 0,
    'delta' => 'latest_content-block_1',
    'module' => 'views',
    'node_types' => array(),
    'pages' => '',
    'roles' => array(),
    'themes' => array(
      'bartik' => array(
        'region' => 'sidebar_second',
        'status' => 1,
        'theme' => 'bartik',
        'weight' => 0,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
    ),
    'title' => '',
    'visibility' => 0,
  );

  return $export;
}
