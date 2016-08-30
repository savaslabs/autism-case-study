<?php
/**
 * @file
 * taxonomy_vocabularies.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function taxonomy_vocabularies_strongarm() {
  $export = array();

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'pathauto_taxonomy_term_resources_pattern';
  $strongarm->value = 'resource/type/[term:name]';
  $export['pathauto_taxonomy_term_resources_pattern'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'pathauto_taxonomy_term_tags_pattern';
  $strongarm->value = '';
  $export['pathauto_taxonomy_term_tags_pattern'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'pathauto_taxonomy_term_visitor_type_pattern';
  $strongarm->value = 'visitor/type/[term:name]';
  $export['pathauto_taxonomy_term_visitor_type_pattern'] = $strongarm;

  return $export;
}
