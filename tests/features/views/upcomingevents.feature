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
  @api @38
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

  # Scenario 4
  @api @38
  Scenario Outline: Check block's contextual filter works on the right pages
    Given "event" content:
      |title      |status |field_visitor_type |field_start_date    |field_end_date      |
      |TestEvent1 |1      |Caregivers         |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
      |TestEvent2 |1      |Parents            |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
      |TestEvent3 |1      |People with AS     |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
      |TestEvent4 |1      |Teachers           |2017-09-01 00:00:00 |2017-09-02 00:00:00 |

    Given I am logged in as a user with the "anonymous user" role
    When I visit "<path>"
    Then I should see "<correct>" in the "sidebar2" region
    And I should not see "<wrong1>" in the "sidebar2" region
    And I should not see "<wrong2>" in the "sidebar2" region
    And I should not see "<wrong3>" in the "sidebar2" region
    Examples:
      |path             |correct    |wrong1     |wrong2     |wrong3     |
      |/caregivers      |TestEvent1 |TestEvent2 |TestEvent3 |TestEvent4 |
      |/parents         |TestEvent2 |TestEvent1 |TestEvent3 |TestEvent4 |
      |/people-with-AS  |TestEvent3 |TestEvent2 |TestEvent1 |TestEvent4 |
      |/teachers        |TestEvent4 |TestEvent2 |TestEvent3 |TestEvent1 |