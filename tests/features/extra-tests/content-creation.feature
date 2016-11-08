Feature: Runs through "content creation" scenarios
  As a developer, I need to verify
  Anonymous, Staff, and Site Admin roles can interact with content properly
  That the created content behaves as we expect

# Scenarios 1-4 Check that Staff users can create content on the site properly
# Scenario 1
  @api @46
  Scenario Outline: Staff user creates Basic Article for Parents
    Given I am logged in as a user with the "staff" role
    When I visit "/"
    And I click "Add content" in the "sidebar1" region
    And I click "Article" in the "maincontent" region
      And I fill in the following:
        | Title | Parent Article                 |
        | Body  | This is an article for Parents |
      And I check the box "Parents"
      And I press the "Save" button
    Then I visit "/"
    Then I should see "Parent Article" in the "maincontent" region
    And I visit "/parents"
    Then I should see "Parent Article" in the "maincontent" region
    And I visit "<path>"
    Then I should not see "<text>" in the "maincontent" region
    Examples:
      | path            | text        |
      | /teachers       | Parent Page |
      | /caregivers     | Parent Page |
      | /people-with-AS | Parent Page |

# Scenario 2
  @api @46
  Scenario Outline: Staff user creates Basic Page for Parents
    Given I am logged in as a user with the "staff" role
    When I visit "/"
    And I click "Add content" in the "sidebar1" region
    And I click "Basic page" in the "maincontent" region
      And I fill in the following:
        | Title | Parent Page                 |
        | Body  | This is a page for Parents  |
      And I check the box "Parents"
      And I press the "Save" button
    Then I visit "/"
    Then I should see "Parent Page" in the "maincontent" region
    And I visit "/parents"
    Then I should see "Parent Page" in the "maincontent" region
    And I visit "<path>"
    Then I should not see "<text>" in the "maincontent" region
    Examples:
      | path            | text        |
      | /teachers       | Parent Page |
      | /caregivers     | Parent Page |
      | /people-with-AS | Parent Page |

# Scenario 3
  @api @46 @failing
  Scenario: Staff user creates Basic Event for Parents
    Given I am logged in as a user with the "staff" role
    When I visit "/"
    And I click "Add content" in the "sidebar1" region
    And I click "Event" in the "maincontent" region
      And I fill in the following:
        | Title        | Parent Event       |
        | Location     | London             |
        | Description  | Event for Parents  |
        | Start Time   | 09:00 AM           |
        | End Time     | 05:00 PM           |
      And I check the box "Parents"
      And I press the "Save" button
    # These below steps are failing even though it works manually...
    And I visit "/parents"
    Then I should see "Parent Event" in the "sidebar2" region
    Then I visit "/"
    Then I should see "Parent Event" in the "sidebar2" region


# Scenario 4
  @api @46 @failing
  Scenario: Staff user creates 2 Resources tagged to different Visitor Types
    Given I am logged in as a user with the "staff" role
      When I visit "/"
      And I click "Add content" in the "sidebar1" region
      And I click "Resource" in the "maincontent" region
        And I fill in "ParentResource1" for "Title"
        And I fill in the following:
          | title       | ParentResource1     |
          | Description | Resource for Parents|
          | URL         | www.bbc.com         |
        And I check the box "Parents"
        And I check the box "Resources for Parents"
        And I press "Save"
      When I visit "/"
      And I click "Add content" in the "sidebar1" region
      And I click "Resource" in the "maincontent" region
        And I fill in "ParentResource1" for "Title"
        And I fill in the following:
          | title       | TeacherResource1     |
          | Description | Resource for Teachers|
          | URL         | www.bbc.com          |
        And I check the box "Teachers"
        And I check the box "Resources for Teachers"
        And I press "Save"

      Then I visit "/resources"
        #clearly on page and this works
        Then I should see "Navigation"
        And I should see "Resources for Parents"
        And I should see "Resources for Teachers"
        #why can't the "title" text be found? Works manually...
        And I should see "ParentResource1"
        And I should see "TeacherResource1"

# This scenario checks Pages tagged with different Visitor Types show up in the
# correct places. The "articles" and "events" have already been checked for this
# in other test suites.
# Scenario 5
  @api @46
  Scenario Outline: Check Pages tagged with different visitor types behaves as expected
    Given "Basic page" content:
      | title        | status | body | field_visitor_type |
      | PageParent   | 1      | ABC  | Parents            |
      | PageTeacher  | 1      | ABC  | Teachers            |
      | PageCaregiver| 1      | ABC  | Caregivers          |
      | PagePeople   | 1      | ABC  | People with AS     |
    
    Given I am logged in as a user with the "staff" role
      When I visit "/"
        Then I should see "PageParent" in the "maincontent" region
        Then I should see "PageTeacher" in the "maincontent" region
        Then I should see "PageCaregiver" in the "maincontent" region
        Then I should see "PagePeople" in the "maincontent" region
      And I visit "<path>"
        Then I should see "<correct>" in the "maincontent" region
        And I should not see "<wrong2>" in the "maincontent" region
        And I should not see "<wrong3>" in the "maincontent" region
        And I should not see "<wrong4>" in the "maincontent" region
      Examples:
        | path            | correct       | wrong2     | wrong3       | wrong4      |
        | /parents        | PageParent    | PageTeacher| PageCaregiver| PagePeople  |
        | /teachers       | PageTeacher   | PageParent | PageCaregiver| PagePeople  |
        | /caregivers     | PageCaregiver | PageParent | PageTeacher  | PagePeople  |
        | /people-with-AS | PagePeople    | PageParent | PageCaregiver| PageTeacher |

# This scenarios checks that Anonymous Users have correct restricted settings
  # Scenario 6
  @api @46
  Scenario Outline: Check Anonymous User cannot create Page, Article, or Event
    Given I am logged in as a user with the "anonymous user" role
      When I visit "/"
      And I click "Add content" in the "sidebar1" region
      Then I should see "Create Forum topic" in the "maincontent" region
      And I should not see "<check1>" in the "sidebar1" region
    Examples:
      | check1 |
      | Article |
      | Basic page |
      | Blog entry |
      | Event |
      | Resource |

# These scnearios check that Site Admin users can create Page, Article, and Event
  # Scenario 7
  @api @46
  Scenario Outline: Check Site Admin user can create an Article and Page
    Given I am logged in as a user with the "site administrator" role
      When I visit "/"
      And I click "Add content" in the "sidebar1" region
      And I click "<content>" in the "maincontent" region
        And I fill in the following:
          | Title | <title> |
          | Body  | <body>  |
        And I check the box "<visitor>"
        And I press the "Save" button
      Then I visit "/"
      Then I should see "<title>" in the "maincontent" region
  Examples:
    | content     | title          | body                           | visitor|
    | Article     | Parent Article | This is an article for Parents | Parents|
    | Basic page  | Parent Page    | This is a Page for Parents     | Parents|

  # Scenario 8
  @api @46 @failing
  Scenario: Check Site Admin user can create an Event
    Given I am logged in as a user with the "site administrator" role
    When I visit "/"
    And I click "Add content" in the "sidebar1" region
    And I click "Event" in the "maincontent" region
      And I fill in the following:
        | Title        | Parent Event       |
        | Location     | London             |
        | Description  | Event for Parents  |
        | Start Time   | 09:00 AM           |
        | End Time     | 05:00 PM           |
      And I check the box "Parents"
      And I press the "Save" button
    Then I visit "/"
    # This step also failing thought it works manually....
    And I click "Parent Event"
    Then I should be on "/parent-event"

# This scenario checks if Staff and Site Admin users can edit content
  # Scenario 9
  @api @46
  Scenario Outline: Check Site Admin and Staff can edit content
    Given "Basic page" content:
      | title        | status | body | field_visitor_type |
      | PageTeacher  | 1      | ABC  | Teachers           |

    Given I am logged in as a user with the "<role>" role
      When I visit "/"
      And I click "PageTeacher" in the "maincontent" region
        Then I should be on "page/pageteacher"
          And I click "Edit" in the "maincontent" region
          And I fill in "Unicorn kisses" for "Body"
          And I press the "Save" button
        Then I should be on "page/pageteacher"
          And I should see "Unicorn kisses" in the "maincontent" region

  Examples:
    | role  |
    | site administrator  |
    | staff               |
