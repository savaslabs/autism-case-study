<?php
/**
 * @file
 * roles_permissions.features.user_role.inc
 */

/**
 * Implements hook_user_default_roles().
 */
function roles_permissions_user_default_roles() {
  $roles = array();

  // Exported role: administrator.
  $roles['administrator'] = array(
    'name' => 'administrator',
    'weight' => 4,
  );

  // Exported role: site administrator.
  $roles['site administrator'] = array(
    'name' => 'site administrator',
    'weight' => 3,
  );

  // Exported role: staff.
  $roles['staff'] = array(
    'name' => 'staff',
    'weight' => 2,
  );

  return $roles;
}
