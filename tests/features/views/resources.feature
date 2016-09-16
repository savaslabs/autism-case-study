Feature: Checks "Resources" View
  As a developer, I need to verify:
  That the "Resources" view page exists and correct roles can view page
  That the sort, filters, and links work

  # Scenarios for "Resources" View Page

  # Scenario 1
  @api @39
  Scenario Outline: Check the "Resources" view page exists and can be accessed
    Given I am logged in as a user with the "<role>" role
    When I visit "/resources"
    Then I should not see "Page Not Found"
    And I should see "Narrow list by Resource Category"
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |

  # Scenario 2
  @api @39
  Scenario Outline: Check content is being sorted by category and title
    Given "resource" content:
      |title            |status |field_resource_category  |
      |Test Resource1.1 |1      |Resources for Caregivers |
      |Test Resource1.2 |1      |Resources for Caregivers |
      |Test Resource2.1 |1      |Resources for Parents |
      |Test Resource2.2 |1      |Resources for Parents |
      |Test Resource3.1 |1      |Resources for People with AS |
      |Test Resource3.2 |1      |Resources for People with AS |
      |Test Resource4.1 |1      |Resources for Teachers |
      |Test Resource4.2 |1      |Resources for Teachers |

    Given I am logged in as a user with the "anonymous user" role
    When I visit "/resources"
    Then the "<view-row>" element should contain "<title>"
    Examples:
      |view-row      |title            |
      |.views-row-1  |Test Resource1.1 |
      |.views-row-2  |Test Resource1.2 |
      |.views-row-3  |Test Resource2.1 |
      |.views-row-4  |Test Resource2.2 |
      |.views-row-5  |Test Resource3.1 |
      |.views-row-6  |Test Resource3.2 |
      |.views-row-7  |Test Resource4.1 |
      |.views-row-8  |Test Resource4.2 |

  # Scenario 3
  @api @39 @now
  Scenario: Check the category filter works
    Given "resource" content:
      |title          |status |field_resource_category      |
      |Test Resource1 |1      |Resources for Caregivers     |
      |Test Resource2 |1      |Resources for Parents        |
      |Test Resource3 |1      |Resources for People with AS |
      |Test Resource4 |1      |Resources for Teachers       |

    Given I am logged in as a user with the "anonymous user" role
    When I visit "/resources"
    And I select "Resources for Caregivers" from "Category"
    And I press the "Apply" button
    Then I should see "Test Resource1"
    And I should not see "Test Resource2"
    And I should not see "Test Resource3"
    And I should not see "Test Resource4"

  # Scenario 4
  @api @39
  Scenario: Check the "read more" link works
    Given "resource" content:
      |title          |status |field_resource_category |
      |Test Resource1 |1      |Resources for Caregivers|

    Given I am logged in as a user with the "anonymous user" role
    When I visit "/resources"
    And I click "Read more"
    Then I should be on "resource/test-resource1"