Feature: Checks Roles and Permissions.
  As a developer
  I need to be able to tell if created roles have the right permissions

  # Scenario 1
  Scenario: Check that "staff" and "site administrator" roles exist
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "staff" role exists
    And I can see that the "site administrator" role exists

  # Scenario 2
  Scenario Outline: Check the "staff" role has the proper permissions
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "staff" role has the "<permission>" permissions
    Examples:
      | permission |
      | author and publish content |
      | post and administer comments |
      | create web forms |
      | manage menus |

  # Scenario 3
  Scenario Outline: Check the "site administrator" role has all permissions
    Given I am logged in as a user with the "administrator" role
    Then I can see that the "site administrator" role has the "<permission>" permissions
    Examples:
      | permission |
      | author and publish content |
      | post and administer comments |
      | create web forms |
      | manage menus |
      # is there an easy way to list ALL the permissions?