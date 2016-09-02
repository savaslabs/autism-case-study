Feature: Checks "Page" content type.
  As a developer
  I need to verify the permissions and fields for the "Page" content type

# Scenarios check Staff can create/edit/delete Page content.
  # Scenario 1
  @api @12
  Scenario: Check Staff user can create Page content
    Given I am logged in as a user with the "staff" role
    When I am at "node/add"
    And I click "Page"
    Then I should be on "node/add/page"
    And I should see text matching "Create Page"
    And I should not see "Access denied"

  # Scenario 2
  @api @12
  Scenario: Check Staff user can edit Page content
    Given I am logged in as a user with the "staff" role
    Then I should be able to edit a "Page"

  # Scenario 3
  @api @12
  Scenario: Check Staff user can delete Page content
    Given "Page" content:
      | title         | status |
      | Test Page  | 1      |
    Given I am logged in as a user with the "staff" role
    When I am at "admin/content"
    And I click "delete" in the "Test Page" row
    Then I should see "Are you sure"
    And I should not see "Access denied"

# Scenarios check 5 Page content nodes all display correct fields.
  # Scenario 4
  @api @12
  Scenario Outline: Check the taxonomy terms are hidden on Page content
    Given "Page" content:
      | title      | status | body | field_visitor_type|
      | Test Page1 | 1      | ABC  | Parents           |
      | Test Page2 | 1      | DEF  | Parents           |
      | Test Page3 | 1      | GHI  | Parents           |
      | Test Page4 | 1      | JKL  | Parents           |
      | Test Page5 | 1      | MNO  | Parents           |
    Given I am logged in as a user with the "staff" role
    When I am at "<path>"
    Then I should not see "Visitor Type"
    Examples:
      | path              |
      | page/test-page1 |
      | page/test-page2 |
      | page/test-page3 |
      | page/test-page4 |
      | page/test-page5 |
