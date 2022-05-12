Feature: Adding Tasks
  As a member of the Berkeley Food Collective
  I want to be able to add a task
  So that I can let others know that a task needs to be done

  Background: Database is loaded with test users and tasks
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

    Given the following tasks in the database
      | name                   | description            | category    | priority | added      | user_add         | complete_time | user_complete | completed |
      | Count cash in register | do this asap please!   | Register    | 3        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | Finished task          | someone completed this | Inventory   | 3        | 2001-01-01 | Roberto Cardenas |   2001-01-02  | Andrew Mo     | true |
      | low priority 1         | low pri description 1  | Engineering | 1        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | low priority 2         | low pri description 2  | Register    | 1        | 2001-01-01 | Andrew Mo        |               |               | false |
      | med priority           | med pri description 1  | Register    | 2        | 2001-01-01 | Roberto Cardenas |               |               | false |

    And the default settings

    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: Add task modal displays correctly
    When I press "Add Task +"
    Then I should see "Add Task"
    And "Task Name" should appear before "New Task..."
    And "Task Description" should appear before "Add new task description..."
    And I should see "Task Category"
    And I should see "Inventory"
    And I should see "Task Priority"
    And the category dropdown on the modal should have the correct options
    And the category dropdown on the modal should have "Inventory" selected
    And there should be the correct priority options
    And the "Low" priority button should be checked

  Scenario: Add a task with default category and priority
    When I enter task name "New Default Task" on the add task modal
    And I enter task description "new task description" on the add task modal
    And I add the task
    Then I should see "New Default Task"
    And "!" should be the priority for "New Default Task"
    And "new task description" should be the description for "New Default Task"
    And "Inventory" should be the category for "New Default Task"
    And "Count cash in register" should appear before "New Default Task"
    And "Roberto" should be the user_added for "New Default Task"
    And "New Default Task" should not say completed

  Scenario: Add a task with different category and priority
    When I press "Add Task +"
    When I enter task name "task 1" on the add task modal
    And I enter task description "task 1 description" on the add task modal
    And I pick "Engineering" from the category dropdown on the add task modal
    Then the category dropdown on the modal should have "Engineering" selected
    And I pick "High" as the priority on the add task modal
    Then the "High" priority button should be checked
    And I add the task
    And I should see "task 1"
    And "task 1 description" should be the description for "task 1"
    And "Engineering" should be the category for "task 1"
    And "task 1" should appear before "low priority 1"
    And "Roberto" should be the user_added for "task 1"
    Then "task 1" should not say completed




  