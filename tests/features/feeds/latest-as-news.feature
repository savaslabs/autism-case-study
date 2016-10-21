Feature: Checks "Latest AS News" Feed
  As a developer, I need to verify:
  That the "Latest AS News" Feed was created
  That the feed can be viewed by all roles

# Scenario 1
  @api @43
  Scenario: Check "Latest AS News" feed was created
    Given I am logged in as a user with the "administrator" role
    When I visit "admin/config/services/aggregator"
    Then I should see "Latest AS News" in the "maincontent" region

# Scenario: 2
  @api @43
  Scenario Outline: Check all roles can view the feed
    Given I am logged in as a user with the "<role>" role
    When I visit "/"
    Then I should see "Latest AS News" in the "sidebar2" region
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |
