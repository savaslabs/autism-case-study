Feature: Checks Forums functionality
  As a developer, I need to verify:
  That the Forums are accessible anonymous users
  That they can review and create posts

  # Scenario 1
  @api @42
  Scenario: Check anonymous user can review posts
    Given I am logged in as a user with the "administrator" role
      When I am at "node/add/forum"
      And I fill in the following:
        | Subject | Topic1 |
        | Body    | We like chocolate! |
      And I select "General Topics" from "Forums"
      And I press the "Save" button
    Given I am an anonymous user
      When I visit "/forum"
      And I click "General Topics"
      Then I should be on "/forums/general-topics"
      And I click "Topic1"
      Then I should be on "/content/topic1"
      And I should see "We like chocolate!"

  # Scenario 2
  @api @42
    