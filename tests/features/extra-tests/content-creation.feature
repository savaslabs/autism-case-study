Feature: Runs through "content creation" scenarios
  As a developer
  I need to verify that created content behaves as we expect

# Scenario 1
  @api @46
  Scenario: Create Basic Page and Articles for each Visitor Type
    Given I am logged in as a user with the "staff" role
    When I visit "/"
    And I click "Content" in the "toolbar" region
    And I click "Add content"
    And I click "Article"
    And I fill in the following:
      | Title        | Parent Article                 |
      | Body         | This is an article for Parents |
      | Visitor Type | Parents                        |
    And I visit "/"
    Then I should see "This is an article for Parents" in the "maincontent" region
    And I visit "/parents"
    Then I should see "This is an article for Parents" in the "maincontent" region
    And I visit "/teachers"
    Then I should not see "This is an article for Parents" in the "maincontent" region

#    And I fill in the following:
#      | Subject | Topic1 |
#      | Body    | We like chocolate! |
#    And I select "General Topics" from "Forums"
#    And I press the "Save" button
#
#    Given "event" content:
#      |title      |status |field_visitor_type |field_start_date    |field_end_date      |
#      |TestEvent1 |1      |Caregivers         |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
#      |TestEvent2 |1      |Parents            |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
#      |TestEvent3 |1      |People with AS     |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
#      |TestEvent4 |1      |Teachers           |2017-09-01 00:00:00 |2017-09-02 00:00:00 |
#
#    Given "Article" content:
#      | title         | status | body | field_visitor_type|
#      | Test Article1 | 1      | ABC  | Parents           |
#      | Test Article2 | 1      | DEF  | Parents           |
#      | Test Article3 | 1      | GHI  | Parents           |
#      | Test Article4 | 1      | JKL  | Parents           |
#      | Test Article5 | 1      | MNO  | Parents           |
#    Given I am logged in as a user with the "staff" role
#    When I am at "<path>"
#    Then I should not see "Visitor Type"
#  Examples:
#  | path              |
#  | article/test-article1 |
#  | article/test-article2 |
#  | article/test-article3 |
#  | article/test-article4 |
#  | article/test-article5 |
