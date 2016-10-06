Feature: Checks "About Us" Page
  As a developer, I need to verify:
  That the "About Us" page exits for all roles
  That the correct information is displayed

  # Scenario 1
  @api @41
  Scenario Outline: Check all roles can access the "About Us" page
    Given I am logged in as a user with the "<role>" role
    When I visit "/page/about-us"
    Then I should not see "Page Not Found"
    And I should see "AANE works with individuals"
    And I should see "AANE (Asperger/Autism Network), one of the first"
    And I should see "Originally called the Asperger's Association of New England"
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |