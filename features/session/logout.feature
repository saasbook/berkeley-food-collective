Feature: Logout
  As a member of the Berkeley Food Collective
  I want to be able to click a logout button
  So that I can logout of the application

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

  Scenario: User wants to logout from the Announcements page
    When I click on the menu tab
    And I press "Log Out"
    Then I should see "Welcome to the Berkeley Student Food Collective App!"

  Scenario: User wants to logout from the Tasks page
    When I follow "Tasks"
    And I click on the menu tab
    And I press "Log Out"
    Then I should see "Welcome to the Berkeley Student Food Collective App!"