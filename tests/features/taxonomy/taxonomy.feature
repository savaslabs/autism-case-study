Feature: Checks Taxonomy Vocabularies and Terms.
  As a developer
  I need to verify that my taxonomy vocabularies exist
  And that they have the proper terms

  @api
  Scenario Outline:  Check for vocabularies
    Given I am logged in as a user with the administrator role
    When I visit "/admin/structure/taxonomy"
    Then I should see "<vocabularies>" in the "taxonomy" region
    Examples:
    |vocabularies|
    |Visitor Type|
    |Resources   |

  @api
  Scenario Outline:  Check for terms in Visitor Type vocabulary
    Given I am logged in as a user with the administrator role
    When I visit "/admin/structure/taxonomy/visitor_type"
    Then I should see the link "<term>" in the "taxonomy" region
    Examples:
    |term|
    |Parents |
    |Teachers|
    |Caregivers|
    |People with AS|

  @api
  Scenario Outline: Check for terms in Resources vocabulary
    Given I am logged in as a user with the administrator role
    When I visit "/admin/structure/taxonomy/resources"
    Then I should see the link "<term>" in the "taxonomy" region
    Examples:
    |term|
    |Resources for Parents|
    |Resources for Teachers|
    |Resources for Caregivers|
    |Resources for People with AS|

  @api
  Scenario Outline:  Check for visitor access to terms pages
    Given I am an anonymous user
    When I visit "<path>"
    Then I should see the heading "<heading>"
    Examples:
    |path|heading|
    |visitor/type/parents|Parents|
    |visitor/type/teachers|Teachers|
    |visitor/type/caregivers|Cargivers|
    |visitor/type/people-with-as|People with AS|
    |resource/type/resources-for-parents|Resources for Parents|
    |resource/type/resources-for-teachers|Resources for Teachers|
    |resource/type/resources-for-caregivers|Resources for Caregivers|
    |resource/type/resources-for-people-with-as|Resources for People with AS|
