#encoding: utf-8
Feature: It is possible to check if the application is alive
  Anyone should be able to check if the application is running

  Scenario: Check if running
    Given The application is running
    When I check keepalive
    Then The application tells me it runs
