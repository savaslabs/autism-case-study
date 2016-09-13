Feature: Checks Roles and Permissions.
  As a developer
  I need to be able to tell if created roles have the right permissions

  # Scenario 1
  @api
  Scenario Outline: Check that proper roles exist
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "<role>" role exists
    Examples:
      | role |
      | staff |
      | site administrator |

  # Scenario 2
  @api
  Scenario: Check the "staff" role has the proper permissions
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "staff" role has all granted permissions

  # Scenario 3
  @api
  Scenario: Check the "site administrator" role has all permissions
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "site administrator" role has all available permissions

  # Scenario 4
  @api
  Scenario: Check the "authenticated user" role has the proper permissions
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "authenticated user" role has all granted permissions

  # Scenario 5
  @api
  Scenario: Check the "anonymous user" role has the proper permissions
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "anonymous user" role has all granted permissions
