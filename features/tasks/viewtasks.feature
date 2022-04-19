Feature: Viewing Tasks
  As a member of the Berkeley Food Collective
  I want to be able to view complete and incomplete tasks in priority order and filter them by category
  So that I can know what tasks have been completed and what tasks need to be done

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

    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: All tasks show up
    Then I should see "Count cash in register"
    Then I should see "Finished task"
    Then I should see "low priority 1"
    Then I should see "low priority 2"
    Then I should see "med priority"

  Scenario: Incomplete tasks show up above complete tasks
    Then "Incomplete Tasks" should appear before "Completed Tasks"
    And "Incomplete Tasks" should appear before "Count cash in register"
    And "Completed Tasks" should appear before "Finished task"

  Scenario: Tasks show up in priority order
    Then "Count cash in register" should appear before "low priority 1"
    Then "Count cash in register" should appear before "low priority 2"
    Then "med priority" should appear before "low priority 1"
    Then "med priority" should appear before "low priority 2"
    And "low priority 2" should appear before "Finished task"

  Scenario: Tasks have correct priority marker
    Then "!!!" should be the priority for "Count cash in register"
    Then "!!!" should be the priority for "Finished task"
    Then "!" should be the priority for "low priority 1"
    Then "!" should be the priority for "low priority 2"
    Then "!!" should be the priority for "med priority"

  Scenario: Tasks have correct descriptions
    Then "do this asap please!" should be the description for "Count cash in register"
    Then "someone completed this" should be the description for "Finished task"
    Then "low pri description 1" should be the description for "low priority 1"
    Then "low pri description 2" should be the description for "low priority 2"
    Then "med pri description 1" should be the description for "med priority"

  Scenario: Tasks have correct categories
    Then "Register" should be the category for "Count cash in register"
    Then "Inventory" should be the category for "Finished task"
    Then "Engineering" should be the category for "low priority 1"
    Then "Register" should be the category for "low priority 2"
    Then "Register" should be the category for "med priority"

  Scenario: Tasks have correct user_added
    Then "Roberto" should be the user_added for "Count cash in register"
    Then "Roberto" should be the user_added for "Finished task"
    Then "Roberto" should be the user_added for "low priority 1"
    Then "Andrew" should be the user_added for "low priority 2"
    Then "Roberto" should be the user_added for "med priority"

  Scenario: Completed tasks have correct user_complete
    Then "Andrew" should be the user_complete for "Finished task"

  Scenario: Incomplete tasks should not say "Completed by"
    Then "Count cash in register" should not say completed
    Then "low priority 1" should not say completed
    Then "low priority 2" should not say completed
    Then "med priority" should not say completed



  