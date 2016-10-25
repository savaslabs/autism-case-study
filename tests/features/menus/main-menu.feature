Feature: Checks "Main Menu"
  As a developer, I need to verify:
  That the "Main Menu" contains the right navigation links
  That the menu can be viewed by all roles

# Scenario 1
  @api @44
  Scenario Outline: Check all roles can see the "Main Menu" links
    Given I am logged in as a user with the "<role>" role
    When I visit "/"
    Then I should see "Home" in the "main_menu" region
    And I should see "Resources" in the "main_menu" region
    And I should see "Events" in the "main_menu" region
    And I should see "About Us" in the "main_menu" region
    And I should see "Contact Us" in the "main_menu" region
    And I should see "Parents" in the "main_menu" region
    And I should see "Teachers" in the "main_menu" region
    And I should see "Caregivers" in the "main_menu" region
    And I should see "Living with AS" in the "main_menu" region
    And I should see "Forums" in the "main_menu" region
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |

## Scenario 2
#  @javascript @api @44 @now
#  Scenario: Check the Menu Links work using Anonymous User
#    Given I am an anonymous user
#    # Demonstrates it works for the "home" menu link
#    When I visit "/parents"
#    And I click "Home" in the "main_menu" region
#    Then I should be on "/"
#    # For some reason it won't work for the "Parentes" link
#    When I visit "/"
#    And I click "Resources" in the "main_menu" region
#    Then I should be on "http://mydrupalsite.dev/resources"

# Scenario 2.1
  @javascript @api @44
  Scenario Outline: Check the Menu Links work using Anonymous User
    Given I am an anonymous user
    When I am on "/"
    And I click "<menu>" in the "main_menu" region
    Then I am at "<path>"
    Examples:
      | menu          | path            |
      | Home          | /               |
      | Resources     | /resources      |
      | Events        | /upcoming-events|
      | About Us      | /page/about-us  |
      | Contact Us    | /contact        |
      | Parents       | /parents        |
      | Teachers      | /teachers       |
      | Caregivers    | /caregivers     |
      | Living with AS | /people-with-AS|
      | Forums         | /forum         |
