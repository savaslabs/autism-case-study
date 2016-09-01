Feature: Site Renders Properly

  @javascript @api
  Scenario: Check the site displays
    Given I am logged in as a user with the administrator role
    Given I visit "/"
    Then I should see "My Test Site"
