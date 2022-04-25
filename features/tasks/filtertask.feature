Feature: Viewing Tasks
  As a member of the Berkeley Food Collective
  I want to be able to filter tasks by category
  So that I can see tasks that are only form certain categories

  Background: Database is loaded with test users and tasks
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

    Given the following tasks in the database
      | name                   | description            | category    | priority | added      | user_add         | complete_time | user_complete | completed |
      | Count cash in register | do this asap please!   | Register    | 3        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | Some other task        | someone completed this | Inventory   | 3        | 2001-01-01 | Roberto Cardenas |   2001-01-02  | Andrew Mo     | true |
      | low priority 1         | low pri description 1  | Engineering | 1        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | low priority 2         | low pri description 2  | Register    | 1        | 2001-01-01 | Andrew Mo        |               |               | false |
      | Completed register     | med pri description 1  | Register    | 2        | 2001-01-01 | Roberto Cardenas |   2001-01-02  |  Melody       | true |

    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: All tasks show up
    Then I should see "Count cash in register"
    Then I should see "Some other task"
    Then I should see "low priority 1"
    Then I should see "low priority 2"
    Then I should see "Completed register"

  Scenario: All categories are available in the dropdown
    Then I should see "Register"
    And I should see "Inventory"
    And I should see "Engineering"
    
  Scenario: All tasks from a specific category and none from the others
    When I pick "Register" from the filter by category dropdown
    Then I should see "Count cash in register"
    Then I should see "low priority 2"
    Then I should see "Completed register"
    Then I should not see "Some other task"
    Then I should not see "low priority 1"

  Scenario: Incomplete tasks show up above complete tasks when selecting a category
    When I pick "Register" from the filter by category dropdown
    Then "Incomplete Tasks" should appear before "Completed Tasks"
    And "Incomplete Tasks" should appear before "Count cash in register"
    And "Completed Tasks" should appear before "Completed register"

  Scenario: Tasks show up in priority order when selecting a category
    When I pick "Register" from the filter by category dropdown
    Then "Count cash in register" should appear before "low priority 2"
    Then "low priority 2" should appear before "Completed register"