<?php
/**
 * @file
 * taxonomy_vocabularies.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function taxonomy_vocabularies_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
