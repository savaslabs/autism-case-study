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
      |Description      |
      |Location         |
      |Start Date       |
      |Start Time       |
      |End Date         |
      |End Time         |
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

# Scenarios check 5 Event content nodes all display correct fields.
  # Scenario 6
  @api @10
  Scenario Outline: Check the taxonomy terms are hidden on Event content
    Given "event" content:
      | title        | status | field_description | field_location | field_start_date    | field_start_time | field_end_date      | field_end_time |
      | Test Event1  | 1      | ABC               | London         | 2016-09-01 00:00:00 | 09:00 AM         | 2016-09-01 00:00:00 | 09:00 PM       |
      | Test Event2  | 1      | DEF               | New York       | 2016-09-01 00:00:00 | 09:00 AM         | 2016-09-01 00:00:00 | 09:00 PM       |
      | Test Event3  | 1      | GHI               | Rio            | 2016-09-01 00:00:00 | 09:00 AM         | 2016-09-01 00:00:00 | 09:00 PM       |
      | Test Event4  | 1      | JKL               | Paris          | 2016-09-01 00:00:00 | 09:00 AM         | 2016-09-01 00:00:00 | 09:00 PM       |
      | Test Event5  | 1      | MNO               | Helsinki       | 2016-09-01 00:00:00 | 09:00 AM         | 2016-09-01 00:00:00 | 09:00 PM       |
    Given I am logged in as a user with the "staff" role
    When I am at "<path>"
    Then I should see "Description"
    And I should see "Location"
    And I should see "Start Date"
    And I should see "Start Time"
    And I should see "End Date"
    And I should see "End Time"
    And I should not see "Visitor Type" in the "maincontent" region
    Examples:
      | path              |
      | event/test-event1 |
      | event/test-event2 |
      | event/test-event3 |
      | event/test-event4 |
      | event/test-event5 |
