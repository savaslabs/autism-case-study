<?php
/**
 * @file
 * views_resources.views_default.inc
 */

/**
 * Implements hook_views_default_views().
 */
function views_resources_views_default_views() {
  $export = array();

  $view = new view();
  $view->name = 'resources';
  $view->description = 'A sortable list of resources';
  $view->tag = 'default';
  $view->base_table = 'node';
  $view->human_name = 'Resources';
  $view->core = 7;
  $view->api_version = '3.0';
  $view->disabled = FALSE; /* Edit this to true to make a default view disabled initially */

  /* Display: Master */
  $handler = $view->new_display('default', 'Master', 'default');
  $handler->display->display_options['title'] = 'Resources';
  $handler->display->display_options['use_more_always'] = FALSE;
  $handler->display->display_options['access']['type'] = 'perm';
  $handler->display->display_options['cache']['type'] = 'none';
  $handler->display->display_options['query']['type'] = 'views_query';
  $handler->display->display_options['exposed_form']['type'] = 'basic';
  $handler->display->display_options['pager']['type'] = 'full';
  $handler->display->display_options['pager']['options']['items_per_page'] = '10';
  $handler->display->display_options['style_plugin'] = 'default';
  $handler->display->display_options['row_plugin'] = 'node';
  /* Relationship: Content: Taxonomy terms on node */
  $handler->display->display_options['relationships']['term_node_tid']['id'] = 'term_node_tid';
  $handler->display->display_options['relationships']['term_node_tid']['table'] = 'node';
  $handler->display->display_options['relationships']['term_node_tid']['field'] = 'term_node_tid';
  $handler->display->display_options['relationships']['term_node_tid']['label'] = 'Resource Terms';
  $handler->display->display_options['relationships']['term_node_tid']['required'] = TRUE;
  $handler->display->display_options['relationships']['term_node_tid']['vocabularies'] = array(
    'resources' => 'resources',
    'forums' => 0,
    'tags' => 0,
    'visitor_type' => 0,
  );
  /* Field: Content: Title */
  $handler->display->display_options['fields']['title']['id'] = 'title';
  $handler->display->display_options['fields']['title']['table'] = 'node';
  $handler->display->display_options['fields']['title']['field'] = 'title';
  $handler->display->display_options['fields']['title']['label'] = '';
  $handler->display->display_options['fields']['title']['alter']['word_boundary'] = FALSE;
  $handler->display->display_options['fields']['title']['alter']['ellipsis'] = FALSE;
  /* Sort criterion: Taxonomy term: Name */
  $handler->display->display_options['sorts']['name']['id'] = 'name';
  $handler->display->display_options['sorts']['name']['table'] = 'taxonomy_term_data';
  $handler->display->display_options['sorts']['name']['field'] = 'name';
  $handler->display->display_options['sorts']['name']['relationship'] = 'term_node_tid';
  $handler->display->display_options['sorts']['name']['expose']['label'] = 'Categories';
  /* Sort criterion: Content: Title */
  $handler->display->display_options['sorts']['title']['id'] = 'title';
  $handler->display->display_options['sorts']['title']['table'] = 'node';
  $handler->display->display_options['sorts']['title']['field'] = 'title';
  /* Filter criterion: Content: Published */
  $handler->display->display_options['filters']['status']['id'] = 'status';
  $handler->display->display_options['filters']['status']['table'] = 'node';
  $handler->display->display_options['filters']['status']['field'] = 'status';
  $handler->display->display_options['filters']['status']['value'] = 1;
  $handler->display->display_options['filters']['status']['group'] = 1;
  $handler->display->display_options['filters']['status']['expose']['operator'] = FALSE;
  /* Filter criterion: Content: Type */
  $handler->display->display_options['filters']['type']['id'] = 'type';
  $handler->display->display_options['filters']['type']['table'] = 'node';
  $handler->display->display_options['filters']['type']['field'] = 'type';
  $handler->display->display_options['filters']['type']['value'] = array(
    'resource' => 'resource',
  );
  /* Filter criterion: Content: Resource Category (field_resource_category) */
  $handler->display->display_options['filters']['field_resource_category_tid']['id'] = 'field_resource_category_tid';
  $handler->display->display_options['filters']['field_resource_category_tid']['table'] = 'field_data_field_resource_category';
  $handler->display->display_options['filters']['field_resource_category_tid']['field'] = 'field_resource_category_tid';
  $handler->display->display_options['filters']['field_resource_category_tid']['exposed'] = TRUE;
  $handler->display->display_options['filters']['field_resource_category_tid']['expose']['operator_id'] = 'field_resource_category_tid_op';
  $handler->display->display_options['filters']['field_resource_category_tid']['expose']['label'] = 'Category';
  $handler->display->display_options['filters']['field_resource_category_tid']['expose']['description'] = 'Narrow list by Resource Category';
  $handler->display->display_options['filters']['field_resource_category_tid']['expose']['operator'] = 'field_resource_category_tid_op';
  $handler->display->display_options['filters']['field_resource_category_tid']['expose']['identifier'] = 'field_resource_category_tid';
  $handler->display->display_options['filters']['field_resource_category_tid']['expose']['remember_roles'] = array(
    2 => '2',
    1 => 0,
    5 => 0,
    4 => 0,
    3 => 0,
  );
  $handler->display->display_options['filters']['field_resource_category_tid']['reduce_duplicates'] = TRUE;
  $handler->display->display_options['filters']['field_resource_category_tid']['type'] = 'select';
  $handler->display->display_options['filters']['field_resource_category_tid']['vocabulary'] = 'resources';

  /* Display: Page */
  $handler = $view->new_display('page', 'Page', 'page');
  $handler->display->display_options['path'] = 'resources';
  $export['resources'] = $view;

  return $export;
}
