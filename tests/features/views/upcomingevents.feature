Feature: Checks "Upcoming Events" View
  As a developer
  I need to verify that the "Upcoming Events" view page exists
  And that the correct roles can view the page

# Scenarios checks the "Upcoming Events" view page exists.
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
