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

# Scenarios check Staff can create/edit/delete Event content.
  # Scenario 3
  @api @10
  Scenario: Check Staff user can create Event content
    Given I am logged in as a user with the "staff" role
    When I am at "node/add"
    And I click "Event"
    Then I should be on "node/add/event"
    And I should see text matching "Create Event"
    And I should not see "Access denied"

  # Scenario 4
  @api @10
  Scenario: Check Staff user can edit Event content
    Given I am logged in as a user with the "staff" role
    Then I should be able to edit a "Event"

  # Scenario 5
  @api @10
  Scenario: Check Staff user can delete Event content
    Given "Event" content:
      | title         | field_description | field_source_url  | status|
      | Test Event    | ABC               | www.google.com    | 1     |
    Given I am logged in as a user with the "staff" role
    When I am at "admin/content"
    And I click "delete" in the "Test Event" row
    Then I should see "Are you sure"
    And I should not see "Access denied"



