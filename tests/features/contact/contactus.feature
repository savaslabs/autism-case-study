Feature: Checks "Contact Us" Contact Category
  As a developer, I need to verify:
  That the "Contact Us" category exists
  That all roles can view and submit the form

# Scenarios checks the "Contact Us" Category
  # Scenario 1
  @api @40
  Scenario: Check "Contact Us" category is the default
    Given I am an anonymous user
    When I visit "/contact"
    Then I should not see "Page Not Found"
    And I should see "Your name" in the "maincontent" region
    And I should see "Your e-mail address" in the "maincontent" region
    And I should see "Subject" in the "maincontent" region
    And I should see "Contact Us" in the "maincontent" region
    And I should see "Message" in the "maincontent" region

  # Scenario 2
  @api @40
  Scenario: Check that anonymous users can submit a "Contact Us" form
    Given I am an anonymous user
    When I visit "/contact"
      And I fill in "Your name" with "Test User"
      And I fill in "Your e-mail address" with "user@example.com"
      And I fill in "Subject" with "Question"
      And I fill in "Message" with "Where are you located?"
      And I press "Send message"
      Then I should see "Your message has been sent."

  # Scenario 3
  @api @40
  Scenario: Check catches submission with missing NAME field
    Given I am an anonymous user
    When I visit "/contact"
      #And I fill in "Your name" with "user"
      And I fill in "Your e-mail address" with "user@example.com"
      And I fill in "Subject" with "Question"
      And I fill in "Message" with "Hello hello"
      And I press "Send message"
    Then I should see the error message "Your name field is required"

  # Scenario 4
  @api @40
  Scenario: Check catches submission with missing EMAIL field
    Given I am an anonymous user
    When I visit "/contact"
    And I fill in "Your name" with "user"
    #And I fill in "Your e-mail address" with "user@example.com"
    And I fill in "Subject" with "Question"
    And I fill in "Message" with "Hello hello"
    And I press "Send message"
    Then I should see the error message "Your e-mail address field is required"

  # Scenario 5
  @api @40
  Scenario: Check catches submission with missing SUBJECT field
    Given I am an anonymous user
    When I visit "/contact"
      And I fill in "Your name" with "user"
      And I fill in "Your e-mail address" with "user@example.com"
      #And I fill in "Subject" with "Question"
      And I fill in "Message" with "Hello hello"
      And I press "Send message"
    Then I should see the error message "Subject field is required"

  # Scenario 6
  @api @40
  Scenario: Check catches submission with missing MESSAGE field
    Given I am an anonymous user
    When I visit "/contact"
    And I fill in "Your name" with "user"
    And I fill in "Your e-mail address" with "user@example.com"
    And I fill in "Subject" with "Question"
    #And I fill in "Message" with "Hello hello"
    And I press "Send message"
    Then I should see the error message "Message field is required"
