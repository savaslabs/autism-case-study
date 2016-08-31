Feature: Checks custom "Resource" content type.
  As a developer
  I need to verify that my custom "Resource" content type exists
  And that the proper fields are displayed according various use roles

  @api
  Scenario:  Check the "Resource" content type exists
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types"
    Then I should see "Resource" in the "content" region

  @api
  Scenario Outline:  Check the "Resource" content type's fields exist
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types/manage/resource/fields"
    Then I should see "<fields>" in the "fields" region
    Examples:
      |fields|
      |Title|
      |Description|
      |URL|
      |Visitor Type|
      |Resource    |

  @api
  Scenario: A Staff user should be able to create Resource content
    Given I am logged in as a user with the "staff" role
    Then I should be able to edit a "Resource"
##
#  Scenario: An staff user should be able create Resource content
#    Given I am logged in as a user with the "staff" role
#    When I go to "node/add/resource"
#    Then I should not see "Access denied"
#
#  Scenario: A Staff user should be able to edit Resource content
#    Given "resource" nodes:
#      | title      | body          | status  |
#      | Test Resource  | test content  | 1       |
#    When I go to "admin/content"
#    And I click "edit" in the "Test Resource" row
#    Then I should not see "Access denied"
#
#  Scenario: A Staff user should be able to delete Resource content
#    Given "resource" nodes:
#      | title      | body          | status  |
#      | Test Resource  | test content  | 1       |
#    When I go to "admin/content"
#    And I click "delete" in the "Test Resource" row
#    Then I should not see "Access denied"