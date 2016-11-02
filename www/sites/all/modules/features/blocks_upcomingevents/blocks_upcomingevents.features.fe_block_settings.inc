<?php
/**
 * @file
 * blocks_upcomingevents.features.fe_block_settings.inc
 */

/**
 * Implements hook_default_fe_block_settings().
 */
function blocks_upcomingevents_default_fe_block_settings() {
  $export = array();

  $export['version'] = '2.0';

  $export['views-upcoming_events-block_1'] = array(
    'cache' => -1,
    'custom' => 0,
    'delta' => 'upcoming_events-block_1',
    'module' => 'views',
    'node_types' => array(),
    'pages' => '<front>
parents
teachers
caregivers
people-with-AS',
    'roles' => array(),
    'themes' => array(
      'bartik' => array(
        'region' => 'sidebar_second',
        'status' => 1,
        'theme' => 'bartik',
        'weight' => -13,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
    ),
    'title' => '',
    'visibility' => 1,
  );

  return $export;
}
