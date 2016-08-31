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
  Scenario:  Check "staff" can edit the "resource" content type
    Given I am logged in as a user with the "staff" role
    Then I should be able to edit a "Resource"