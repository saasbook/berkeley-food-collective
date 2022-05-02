Feature: Navigate
  As a admin of the Berkeley Food Collective
  I want to be able to navigate to the settings page
  So that I can edit the applications settings

  Background: Database is loaded with test users
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

    And the default settings

  When I start on the login page
  When I fill in "session_email" with "robertocardenas@bsfc.coop"
  And I press "Login"
  Then I should see "Announcements"

  Scenario: User wants to navigate to settings from annoucements page
    When I click on the menu tab
    And I press "Admin Settings"
    Then I should see "Airtable Base ID"

  Scenario: User wants to navigate to settings from the Tasks page
    When I follow "Tasks"
    And I click on the menu tab
    And I press "Admin Settings"
    Then I should see "Airtable Base ID"

  Scenario: User wants to navigate to change password page from the Tasks page
    When I follow "Tasks"
    And I click on the menu tab
    And I press "Admin Settings"
    And I follow "Click here to change Admin Password"
    Then I should see "Current Password"
    Then I should see "New Password"
    Then I should see "Confirm New Password"

