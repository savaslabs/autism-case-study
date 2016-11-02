Feature: Checks "Latest Content" View
  As a developer, I need to verify:
  That the "Latest Content" View Pages and Blocks exist
  That roles have the correct access and the contextual filters work

# Scenarios check existence and access of Pages and Block
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
  @api @30
  Scenario Outline: Check the "latest content" block exists on homepage only
    Given "article" content:
      |title        |status |field_visitor_type |
      |TestArticle1 |1      |Caregivers         |
      |TestArticle2 |1      |Parents            |

    Given I am logged in as a user with the "<role>" role
    When I visit "/"
    Then I should see "Latest Content Posted" in the "maincontent" region
    And I visit "/resources"
    Then I should not see "Latest Content Posted" in the "maincontent" region
    Examples:
      |role               |
      |anonymous user     |
      |authenticated user |
      |staff              |
      |administrator      |

# Scenarios check the contextual filter
  @api @30
  Scenario Outline: Check the contextual filters work for each page
    Given "article" content:
    |title        |status |field_visitor_type |
    |TestArticle1 |1      |Caregivers         |
    |TestArticle2 |1      |Parents            |
    |TestArticle3 |1      |People with AS     |
    |TestArticle4 |1      |Teachers           |

    Given I am logged in as a user with the "anonymous user" role
    When I visit "<path>"
    Then I should see "<correct>" in the "maincontent" region
    And I should not see "<wrong1>" in the "maincontent" region
    And I should not see "<wrong2>" in the "maincontent" region
    And I should not see "<wrong3>" in the "maincontent" region
    Examples:
      |path         |correct      |wrong1       |wrong2       |wrong3       |
      |/caregivers  |TestArticle1 |TestArticle2 |TestArticle3 |TestArticle4 |
      |/parents     |TestArticle2 |TestArticle1 |TestArticle3 |TestArticle4 |
      |/people-with-AS  |TestArticle3 |TestArticle2 |TestArticle1 |TestArticle4 |
      |/teachers  |TestArticle4 |TestArticle2 |TestArticle3 |TestArticle1 |