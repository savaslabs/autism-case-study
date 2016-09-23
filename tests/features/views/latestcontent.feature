Feature: Checks "Latest Content" View
  As a developer, I need to verify:
  That the "Latest Content" View Pages and Blocks exist
  That roles have the correct access and the contextual filters work

# Scenarios check existance and access of Pages and Block
  # Scenario 1
  @api @30
  Scenario Outline: Check the "Latest Content" view pages exist with correct access
    Given I am logged in as a user with the "<role>" role
    When I visit "<path>"
    Then I should not see "Page Not Found"
    Examples:
      |role           |path             |
      |anonymous user |/upcoming-events |
      |anonymous user |/caregivers      |
      |anonymous user |/parents         |
      |anonymous user |/people-with-AS  |
      |anonymous user |/teachers        |
      |authenticated user |/upcoming-events |
      |authenticated user |/caregivers      |
      |authenticated user |/parents         |
      |authenticated user |/people-with-AS  |
      |authenticated user |/teachers        |
      |staff |/upcoming-events |
      |staff |/caregivers      |
      |staff |/parents         |
      |staff |/people-with-AS  |
      |staff |/teachers        |
      |administrator |/upcoming-events |
      |administrator |/caregivers      |
      |administrator |/parents         |
      |administrator |/people-with-AS  |
      |administrator |/teachers        |

  # Scenario 2
  @api @30 @now
    Scenario Outline: Check the "latest content" block exists in homepage sidebar
      Given I am logged in as a user with the "<role>" role
      When I visit "/"
      Then I should see "Latest Content Posted" in the "sidebar2" region
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |
