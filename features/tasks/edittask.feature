Feature: Editing Tasks
  As a member of the Berkeley Food Collective
  I want to be able to edit and delete tasks
  So that I can change the tasks page to have updated information 

  Background: Database is loaded with test users and tasks
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

    Given the following tasks in the database
      | name                   | description            | category    | priority | added      | user_add         | complete_time | user_complete | completed | id |
      | Count cash in register | do this asap please!   | Register    | 3        | 2001-01-01 | Roberto Cardenas |               |               | false     | 1 |
      | Finished task          | someone completed this | Inventory   | 3        | 2001-01-01 | Roberto Cardenas |   2001-01-02  | Andrew Mo     | true      | 2 |
      | low priority 1         | low pri description 1  | Engineering | 1        | 2001-01-01 | Roberto Cardenas |               |               | false     | 3 |
      | low priority 2         | low pri description 2  | Register    | 1        | 2001-01-01 | Andrew Mo        |               |               | false     | 4 |
      | med priority           | med pri description 1  | Register    | 2        | 2001-01-01 | Roberto Cardenas |               |               | false     | 5 |
      | another done task      | someone did this       | Inventory   | 3        | 2001-01-01 | Roberto Cardenas |   2001-01-02  | Andrew Mo     | true      | 6 |
      | high priority 2        | high pri description 2 | Register    | 3        | 2001-01-01 | Roberto Cardenas |               |               | false     | 7 |


    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: Edit Task Modal displays correctly
    When I tap the dots to edit "Count cash in register"
    Then I should see "Edit Existing Task"
    Then "Task Name" should appear before "Count cash in register"
    Then "Task Description" should appear before "do this asap please!"
    Then I should see "Task Category"
    Then I should see "Task Priority"
    Then the category dropdown on the modal should have the correct options
    Then the category dropdown on the modal should have "Register" selected
    Then there should be the correct priority options
    Then the "High" priority button on the edit task modal should be checked for the task with id "1"

  Scenario: I can edit a task's name
    When I tap the dots to edit "Count cash in register"
    When I enter task name "changed task name" on the edit task modal for the task with id "1"
    And I confirm "Edit Task" for the task with id "1"
    Then I should see "changed task name"
    Then I should not see "Count cash in register"

  Scenario: I can edit a task's description
    When I tap the dots to edit "Count cash in register"
    When I enter task description "changed task description" on the edit task modal for the task with id "1"
    And I confirm "Edit Task" for the task with id "1"
    Then "changed task description" should be the description for "Count cash in register"
    Then I should not see "do this asap please!"  

  Scenario: I can edit a task's category
    When I tap the dots to edit "Count cash in register"
    When I pick "Inventory" from the category dropdown on the edit task modal for the task with id "1"
    And I confirm "Edit Task" for the task with id "1"
    Then "Inventory" should be the category for "Count cash in register"

  Scenario: I can edit a task's priority
    When I tap the dots to edit "Count cash in register"
    And I pick "Medium" as the priority on the edit task modal for the task with id "1"
    And I confirm "Edit Task" for the task with id "1"
    Then "high priority 2" should appear before "Count cash in register"

  Scenario: I can delete a task
    When I tap the dots to edit "Count cash in register"
    And I confirm "Delete Task" for the task with id "1"
    Then I should not see "Count cash in register"
