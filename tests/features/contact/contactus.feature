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

  # Scenario 2
  @api @40 @now
  Scenario Outline: Check all roles can submit a "Contact Us" form
    Given I am logged in as a user with the "<role>" role
    When I visit "/contact"
      And I fill in "Your name" with "Test User"
      And I fill in "Your e-mail address" with "user@example.com"
      And I fill in "Subject" with "Question"
      And I fill in "Message" with "Where are you located?"
      And I press "Send message"
      Then I should see "Your message has been sent."
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |
