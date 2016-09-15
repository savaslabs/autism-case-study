Feature: Checks "Upcoming Events" Views
  As a developer, I need to verify:
  That the 2 "Upcoming Events" views (page and block) exist
  That roles have the correct permissions
  That the views have the correct configurations

# Scenarios check the "Upcoming Events" view PAGE.
  # Scenario 1
  @api @37
  Scenario Outline: Check the "Upcoming Events" view page exists and can be accessed
    Given I am logged in as a user with the "<role>" role
    When I visit "/upcoming-events"
    Then I should not see "Page Not Found"
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |

  # Scenario 2
  @api @37
  Scenario: Check the date filter is working properly
    Given "event" content:
      | title        | status | field_description | field_start_date    | field_end_date      |
      | Test Event1  | 1      | ABC               | 2014-09-01 00:00:00 | 2016-09-01 00:00:00 |
      | Test Event2  | 1      | DEF               | 2015-09-01 00:00:00 | 2017-09-01 00:00:00 |
      | Test Event3  | 1      | GHI               | 2016-09-01 00:00:00 | 2017-09-01 00:00:00 |
      | Test Event4  | 1      | JKL               | 2017-09-01 00:00:00 | 2017-09-01 00:00:00 |
      | Test Event5  | 1      | MNO               | 2018-09-01 00:00:00 | 2017-09-01 00:00:00 |
    Given I am logged in as a user with the "administrator" role
    When I visit "/upcoming-events"
    Then I should not see "Test Event1"
    And I should see "Test Event2"
    And I should see "Test Event3"
    And I should see "Test Event4"
    And I should see "Test Event5"

    # Scenarios check the "Upcoming Events" view BLOCK.
  