<?php
/**
 * @file
 * menu_main.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function menu_main_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: main-menu_about-us:node/1.
  $menu_links['main-menu_about-us:node/1'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/1',
    'router_path' => 'node/%',
    'link_title' => 'About Us',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_about-us:node/1',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 3,
    'customized' => 1,
  );
  // Exported menu link: main-menu_caregivers:caregivers.
  $menu_links['main-menu_caregivers:caregivers'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'caregivers',
    'router_path' => 'caregivers',
    'link_title' => 'Caregivers',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_caregivers:caregivers',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 7,
    'customized' => 1,
  );
  // Exported menu link: main-menu_contact-us:contact.
  $menu_links['main-menu_contact-us:contact'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'contact',
    'router_path' => 'contact',
    'link_title' => 'Contact Us',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_contact-us:contact',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 4,
    'customized' => 1,
  );
  // Exported menu link: main-menu_events:upcoming-events.
  $menu_links['main-menu_events:upcoming-events'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'upcoming-events',
    'router_path' => 'upcoming-events',
    'link_title' => 'Events',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_events:upcoming-events',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 2,
    'customized' => 1,
  );
  // Exported menu link: main-menu_forums:forum.
  $menu_links['main-menu_forums:forum'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'forum',
    'router_path' => 'forum',
    'link_title' => 'Forums',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_forums:forum',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 9,
    'customized' => 1,
  );
  // Exported menu link: main-menu_home:<front>.
  $menu_links['main-menu_home:<front>'] = array(
    'menu_name' => 'main-menu',
    'link_path' => '<front>',
    'router_path' => '',
    'link_title' => 'Home',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_home:<front>',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 1,
  );
  // Exported menu link: main-menu_living-with-as:people-with-as.
  $menu_links['main-menu_living-with-as:people-with-as'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'people-with-as',
    'router_path' => 'people-with-AS',
    'link_title' => 'Living with AS',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_living-with-as:people-with-as',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 8,
    'customized' => 1,
  );
  // Exported menu link: main-menu_parents:parents.
  $menu_links['main-menu_parents:parents'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'parents',
    'router_path' => 'parents',
    'link_title' => 'Parents',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_parents:parents',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 5,
    'customized' => 1,
  );
  // Exported menu link: main-menu_resources:resources.
  $menu_links['main-menu_resources:resources'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'resources',
    'router_path' => 'resources',
    'link_title' => 'Resources',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_resources:resources',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 1,
    'customized' => 1,
  );
  // Exported menu link: main-menu_teachers:teachers.
  $menu_links['main-menu_teachers:teachers'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'teachers',
    'router_path' => 'teachers',
    'link_title' => 'Teachers',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_teachers:teachers',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 6,
    'customized' => 1,
  );

  // Translatables
  // Included for use with string extractors like potx.
  t('About Us');
  t('Caregivers');
  t('Contact Us');
  t('Events');
  t('Forums');
  t('Home');
  t('Living with AS');
  t('Parents');
  t('Resources');
  t('Teachers');

  return $menu_links;
}
