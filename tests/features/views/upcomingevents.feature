Feature: Checks "Upcoming Events" View
  As a developer, I need to verify:
  That the "Upcoming Events" View page and block exist
  That all roles can view and correct content is being displayed

# Scenarios checks the "Upcoming Events" View PAGE.
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

# Scenarios check the "Upcoming Events" View BLOCK.
  # Scenario 3
  @api @38 @now
  Scenario Outline: Check the block exists on home page for all roles
    Given "event" content:
      | title        | status | field_description | field_start_date    | field_end_date      |
      | Test Event1  | 1      | ABC               | 2017-09-01 00:00:00 | 2017-09-02 00:00:00 |
      | Test Event2  | 1      | DEF               | 2015-09-01 00:00:00 | 2017-09-01 00:00:00 |

    Given I am logged in as a user with the "<role>" role
    When I visit "/"
    Then I should see "Upcoming Events" in the "sidebar2" region
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |
