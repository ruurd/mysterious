#encoding: utf-8
Feature: There is a login for users
  If I am a user
  I should be able to log in and adapt my questions

  Scenario: Log in
    Given The application is running
    When Nobody is logged in
    And I request the login page
    And I enter valid credentials
    Then I am logged in

  Scenario: Log out
    Given The application is running
    When I am logged in
    And I request to be logged out
    Then I am logged out


