Feature: Logout
  As a member of the Berkeley Food Collective
  I want to be able to click a logout button
  So that I can logout of the application

  Background: Database is loaded with test users
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

  When I start on the login page
  When I login with "robertocardenas@berkeley.edu"

  Scenario: User wants to logout form the Announcements page
    When I visit the announcements page
    And I follow "Log Out"
    Then I should see "Welcome to the Berkeley Student Food Collective App!"

  Scenario: User wants to logout from the Tasks page
    When I visit the tasks page
    And I follow "Log Out"
    Then I should see "Welcome to the Berkeley Student Food Collective App!"