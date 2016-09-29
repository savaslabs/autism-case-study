<?php
/**
 * @file
 * contact_contact_us.features.contact_categories.inc
 */

/**
 * Implements hook_contact_categories_defaults().
 */
function contact_contact_us_contact_categories_defaults() {
  return array(
    'Contact Us' => array(
      'category' => 'Contact Us',
      'recipients' => 'ro@savaslabs.com',
      'reply' => 'Thank you for contacting us!
Your email has been received and we will respond within the next few days.',
      'weight' => 0,
      'selected' => 1,
    ),
  );
}
