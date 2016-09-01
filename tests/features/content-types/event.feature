Feature: Checks custom "Event" content type.
  As a developer
  I need to verify that my custom "Event" content type exists
  And that the proper fields are displayed according various use roles

# Scenarios check the Event content type exists and has correct fields.
  # Scenario 1
  @api @10
  Scenario:  Check the "Event" content type exists
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types"
    Then I should see "Event" in the "content" region

  # Scenario 2
  @api @10
  Scenario Outline:  Check the "Event" content type's fields exist
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types/manage/event/fields"
    Then I should see "<fields>" in the "fields" region
    Examples:
      |fields           |
      |Title            |
      |Location         |
      |Start Date       |
      |Start Time       |
      |End Date         |
      |End Time         |
      |Description      |
      |More Information |
      |Visitor Type     |

