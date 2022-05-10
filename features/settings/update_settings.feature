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
  When I follow "Tasks"
  And I click on the menu tab
  And I press "Admin Settings"

  Scenario: User wants to change a setting
    And I fill in "Airtable Base ID" with "somethingelse"
    And I fill in "password" with "ilovebfc"
    And I press "Update Settings"
    Then I should see "Airtable Base ID"
    And I should see "successfully updated settings!"

  Scenario: User wants to update password
    And I follow "Click here to change Admin Password"
    And I fill in "password" with "ilovebfc"
    And I fill in "new_password" with "new"
    And I fill in "new_password_confirmation" with "new"
    And I press "Change Password"
    Then I should see "Successfully updated admin password!"

  Scenario: User wants to update password using incorrect admin password
    And I follow "Click here to change Admin Password"
    And I fill in "password" with "wrongpass"
    And I fill in "new_password" with "new"
    And I fill in "new_password_confirmation" with "new"
    And I press "Change Password"
    Then I should see "Incorrect password!"

  Scenario: User wants to update password blank password
    And I follow "Click here to change Admin Password"
    And I fill in "password" with "ilovebfc"
    And I press "Change Password"
    Then I should see "New password can't be blank"

  Scenario: User wants to update password but mistypes new password
    And I follow "Click here to change Admin Password"
    And I fill in "password" with "ilovebfc"
    And I fill in "new_password" with "new"
    And I fill in "new_password_confirmation" with "new1"
    And I press "Change Password"
    Then I should see "New password confirmation doesn't match New password"
