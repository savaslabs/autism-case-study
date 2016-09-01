Feature: Checks custom "Resource" content type.
  As a developer
  I need to verify that my custom "Resource" content type exists
  And that the proper fields are displayed according various use roles

# Scenarios check the Resource content type exists and has correct fields.
  # Scenario 1
  @api
  Scenario:  Check the "Resource" content type exists
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types"
    Then I should see "Resource" in the "content" region

  # Scenario 2
  @api
  Scenario Outline:  Check the "Resource" content type's fields exist
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/structure/types/manage/resource/fields"
    Then I should see "<fields>" in the "fields" region
    Examples:
      |fields|
      |Title|
      |Description|
      |URL|
      |Visitor Type|
      |Resource    |

# Scenarios check Staff can create/edit/delete Resource content.
  # Scenario 3
  @api
  Scenario: Check Staff user can create Resource content
    Given I am logged in as a user with the "staff" role
    When I am at "node/add"
    And I click "Resource"
    Then I should be on "node/add/resource"
    And I should see text matching "Create Resource"
    And I should not see "Access denied"

  # Scenario 4
  @api
  Scenario: Check Staff user can edit Resource content
    Given I am logged in as a user with the "staff" role
    Then I should be able to edit a "Resource"

  # Scenario 5
  @api
  Scenario: Check Staff user can delete Resource content
    Given "resource" content:
      | title         | field_description | field_source_url  | status|
      | Test Resource | ABC               | www.google.com    | 1     |
    Given I am logged in as a user with the "staff" role
    When I am at "admin/content"
    And I click "delete" in the "Test Resource" row
    Then I should see "Are you sure"
    And I should not see "Access denied"

# Scenarios check 5 Resource content nodes all display correct fields.
  # Scenario 6
  @api
  Scenario Outline: Check the taxonomy terms are hidden on Resource content
    Given "resource" content:
      | title           | field_description | field_source_url  | status |
      | Test Resource1  | ABC               | www.google.com    | 1      |
      | Test Resource2  | DEF               | www.google.com    | 1      |
      | Test Resource3  | GHI               | www.google.com    | 1      |
      | Test Resource4  | JKL               | www.google.com    | 1      |
      | Test Resource5  | MNO               | www.google.com    | 1      |
    Given I am logged in as a user with the "staff" role
    When I am at "<path>"
    Then I should see "Description"
    And I should see "Source URL"
    And I should not see "Visitor Type"
    And I should not see "Resource Category"
    Examples:
      | path                    |
      | resource/test-resource1 |
      | resource/test-resource2 |
      | resource/test-resource3 |
      | resource/test-resource4 |
      | resource/test-resource5 |
