Feature: Site Renders Properly

  @api
  Scenario: Check the site displays
    Given I am logged in as a user with the administrator role
    Given I visit "/"
    Then I should see "Parenting Kids with Aspergers Syndrome"
