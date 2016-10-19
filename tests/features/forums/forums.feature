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
  @api @42 @now
  Scenario: Check anonymous user can create new topic and comment on topic
    Given I am logged in as a user with the "anonymous user" role
    # Use this step as opposed to "Given I am an anonymous user" because we want
    # Behat to delete the temporary content the "anonymous user" will create in
    # this scenario. If using the "simple" step, it won't delete the content.
      When I visit "/forum"
      And I click "Events"
      Then I should be on "/forums/events"
      And I click "Add new Forum topic"
      And I fill in the following:
        | Subject | Ideas for chocolate appreciation |
        | Body    | What can we do to show our love for chocolate? |
      And I press the "Save" button
      Then I should be on "/content/ideas-chocolate-appreciation"
      And I should see "Ideas for chocolate appreciation"
      And I fill in the following:
        #| Your name | chocolover  |
        | Subject   | Fondue?     |
        | Comment   | What about a chocolate fondue or chocolate waterfall?|
      And I press the "Save" button
      Then I should see "chocolate fondue" in the "comments" region

