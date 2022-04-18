Feature: Filtering Tasks
  As a member of the Berkeley Food Collective
  I want to be able to filter tasks by category
  So that I can see tasks only for a particular category

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

  Scenario: Filter dropdown should have the correct categories
    Then the category dropdown should have the correct options
    Then the category dropdown should have "All Categories" selected

  Scenario: Filter tasks by category
    When I filter tasks by "Inventory"
    Then the category dropdown should have "Inventory" selected
    Then I should see "Finished task"
    Then I should see "another done task"
    Then I should not see "Count cash in register"
    Then I should not see "low priority 1"
    Then I should not see "low priority 2"
    Then I should not see "med priority"
    Then I should not see "high priority 2"
    When I filter tasks by "All Categories"
    Then I should see "Finished task"
    Then I should see "another done task"
    Then I should see "Count cash in register"
    Then I should see "low priority 1"
    Then I should see "low priority 2"
    Then I should see "med priority"
    Then I should see "high priority 2"
    When I filter tasks by "Engineering"
    Then I should not see "Finished task"
    Then I should not see "another done task"
    Then I should not see "Count cash in register"
    Then I should see "low priority 1"
    Then I should not see "low priority 2"
    Then I should not see "med priority"
    Then I should not see "high priority 2"
