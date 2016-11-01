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

  // Exported menu link: main-menu_about-us:http://mydrupalsite.dev/page/about-us.
  $menu_links['main-menu_about-us:http://mydrupalsite.dev/page/about-us'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/page/about-us',
    'router_path' => '',
    'link_title' => 'About Us',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_about-us:http://mydrupalsite.dev/page/about-us',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 3,
    'customized' => 1,
  );
  // Exported menu link: main-menu_caregivers:http://mydrupalsite.dev/caregivers.
  $menu_links['main-menu_caregivers:http://mydrupalsite.dev/caregivers'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/caregivers',
    'router_path' => '',
    'link_title' => 'Caregivers',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_caregivers:http://mydrupalsite.dev/caregivers',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 7,
    'customized' => 1,
  );
  // Exported menu link: main-menu_contact-us:http://mydrupalsite.dev/contact.
  $menu_links['main-menu_contact-us:http://mydrupalsite.dev/contact'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/contact',
    'router_path' => '',
    'link_title' => 'Contact Us',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_contact-us:http://mydrupalsite.dev/contact',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 4,
    'customized' => 1,
  );
  // Exported menu link: main-menu_events:http://mydrupalsite.dev/upcoming-events.
  $menu_links['main-menu_events:http://mydrupalsite.dev/upcoming-events'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/upcoming-events',
    'router_path' => '',
    'link_title' => 'Events',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_events:http://mydrupalsite.dev/upcoming-events',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 2,
    'customized' => 1,
  );
  // Exported menu link: main-menu_forums:http://mydrupalsite.dev/forum.
  $menu_links['main-menu_forums:http://mydrupalsite.dev/forum'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/forum',
    'router_path' => '',
    'link_title' => 'Forums',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_forums:http://mydrupalsite.dev/forum',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
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
  // Exported menu link: main-menu_living-with-as:http://mydrupalsite.dev/people-with-as.
  $menu_links['main-menu_living-with-as:http://mydrupalsite.dev/people-with-as'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/people-with-as',
    'router_path' => '',
    'link_title' => 'Living with AS',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_living-with-as:http://mydrupalsite.dev/people-with-as',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 8,
    'customized' => 1,
  );
  // Exported menu link: main-menu_parents:http://mydrupalsite.dev/parents.
  $menu_links['main-menu_parents:http://mydrupalsite.dev/parents'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/parents',
    'router_path' => '',
    'link_title' => 'Parents',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_parents:http://mydrupalsite.dev/parents',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 5,
    'customized' => 1,
  );
  // Exported menu link: main-menu_resources:http://mydrupalsite.dev/resources.
  $menu_links['main-menu_resources:http://mydrupalsite.dev/resources'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/resources',
    'router_path' => '',
    'link_title' => 'Resources',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_resources:http://mydrupalsite.dev/resources',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 1,
    'customized' => 1,
  );
  // Exported menu link: main-menu_teachers:http://mydrupalsite.dev/teachers.
  $menu_links['main-menu_teachers:http://mydrupalsite.dev/teachers'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'http://mydrupalsite.dev/teachers',
    'router_path' => '',
    'link_title' => 'Teachers',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_teachers:http://mydrupalsite.dev/teachers',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
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
