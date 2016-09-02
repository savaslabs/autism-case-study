Feature: Checks "Article" content type.
  As a developer
  I need to verify the permissions and fields for the "Article" content type

# Scenarios check Staff can create/edit/delete Article content.
  # Scenario 1
  @api @11
  Scenario: Check Staff user can create Article content
  Given I am logged in as a user with the "staff" role
  When I am at "node/add"
  And I click "Article"
  Then I should be on "node/add/article"
  And I should see text matching "Create Article"
  And I should not see "Access denied"

  # Scenario 2
  @api @11
  Scenario: Check Staff user can edit Article content
  Given I am logged in as a user with the "staff" role
  Then I should be able to edit a "Article"

  # Scenario 3
  @api @11
  Scenario: Check Staff user can delete Article content
  Given "Article" content:
  | title         | status |
  | Test Article  | 1      |
  Given I am logged in as a user with the "staff" role
  When I am at "admin/content"
  And I click "delete" in the "Test Article" row
  Then I should see "Are you sure"
  And I should not see "Access denied"

# Scenarios check 5 Article content nodes all display correct fields.
  # Scenario 4
  @api @11
  Scenario Outline: Check the taxonomy terms are hidden on Article content
    Given "Article" content:
      | title         | status | body | field_visitor_type|
      | Test Article1 | 1      | ABC  | Parents           |
      | Test Article2 | 1      | DEF  | Parents           |
      | Test Article3 | 1      | GHI  | Parents           |
      | Test Article4 | 1      | JKL  | Parents           |
      | Test Article5 | 1      | MNO  | Parents           |
    Given I am logged in as a user with the "staff" role
    When I am at "<path>"
    Then I should not see "Visitor Type"
    Examples:
      | path              |
      | article/test-article1 |
      | article/test-article2 |
      | article/test-article3 |
      | article/test-article4 |
      | article/test-article5 |
