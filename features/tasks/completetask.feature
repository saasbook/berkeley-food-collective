Feature: Checking off Tasks
  As a member of the Berkeley Food Collective
  I want to be able to check off / uncheck tasks
  So that I can let everyone know which tasks are complete and incomplete

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


    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: Checking off a task
    And I check-off "Count cash in register"
    Then I should see "Confirm Task Completion"
    And I confirm "Complete Task" for the task with id "1"
    Then "Roberto" should be the user_complete for "Count cash in register"
    Then "Completed Tasks" should appear before "Count cash in register"

  Scenario: Unchecking a task
    And I uncheck-off "Finished task"
    Then I should see "Confirm Task Completion"
    And I confirm "Undo Task Completion" for the task with id "2"
    Then "Finished task" should not say completed
    Then "Finished task" should appear before "Completed Tasks"

