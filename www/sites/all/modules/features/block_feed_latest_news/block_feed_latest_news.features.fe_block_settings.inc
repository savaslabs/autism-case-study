<?php
/**
 * @file
 * block_feed_latest_news.features.fe_block_settings.inc
 */

/**
 * Implements hook_default_fe_block_settings().
 */
function block_feed_latest_news_default_fe_block_settings() {
  $export = array();

  $export['version'] = '2.0';

  $export['aggregator-feed-1'] = array(
    'cache' => 1,
    'custom' => 0,
    'delta' => 'feed-1',
    'module' => 'aggregator',
    'node_types' => array(),
    'pages' => '<front>
resources',
    'roles' => array(),
    'themes' => array(
      'bartik' => array(
        'region' => 'sidebar_second',
        'status' => 1,
        'theme' => 'bartik',
        'weight' => -12,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
    ),
    'title' => 'Latest AS News',
    'visibility' => 1,
  );

  return $export;
}
