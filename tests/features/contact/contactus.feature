Feature: Checks "Contact Us" Contact Category
  As a developer, I need to verify:
  That the "Contact Us" category exists
  That all roles can view and submit the form

# Scenarios checks the "Contact Us" Category
  # Scenario 1
  @api @40
  Scenario Outline: Check "Contact Us" category is the default
    Given I am logged in as a user with the "<role>" role
    When I visit "/contact"
    Then I should not see "Page Not Found"
    And I should see "Your name" in the "maincontent" region
    And I should see "Your e-mail address" in the "maincontent" region
    And I should see "Subject" in the "maincontent" region
    And I should see "Contact Us" in the "maincontent" region
    And I should see "Message" in the "maincontent" region
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |
