Feature: Checks "Resources" View
  As a developer, I need to verify:
  That the "Resources" view page and sort function exists
  That the correct roles can view the page

# Scenario checks the "Resources" view page exists, roles can view, and sort exists.
  # Scenario 1
  @api @39
  Scenario Outline: Check the "Resources" view page exists and can be accessed
    Given I am logged in as a user with the "<role>" role
    When I visit "/resources"
    Then I should not see "Page Not Found"
    And I should see "Sort by"
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |
