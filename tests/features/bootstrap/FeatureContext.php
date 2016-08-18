<?php

/**
 * @file
 * Default FeatureContext class.
 */

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /**
   * Test if role exists.
   *
   * @Then I can see that the :arg1 role exists
   *
   * This function is a custom Gerkin step used in the Roles & Permissions testing
   * in the "roles-permissions.feature" test file.
   */
  public function iCanSeeThatTheRoleExists($arg1) {
    $role_exists = FALSE;
    $drupal_roles = user_roles(TRUE);
    foreach ($drupal_roles as $rid => $role) {
      if ($arg1 == $role) {
        $role_exists = TRUE;
      }
    }
    if (!$role_exists) {
      throw new Exception(sprintf('Role %s does not exist!', $arg1));
    }
  }

  /**
   * Test if role has permission.
   *
   * @Then I can see that the :arg1 role has the :arg2 permissions
   *
   * This function is a custom Gerkin step used in the Roles & Permissions testing
   * in the "roles-permissions.feature" test file.
   */
  public function iCanSeeThatTheRoleHasThePermission($arg1, $arg2) {
    $arg_to_check = $this->modifyPermission($arg2);
    $permissions = $this->roles[$arg1];
    if (!in_array($arg_to_check, $permissions)) {
      throw new Exception(sprintf('Role %s does not have the "%s" permission.', $arg1, $arg2));
    }
  }
}
