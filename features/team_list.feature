Feature: Team List
  As a user
  I want to list teams
  So that I can see what teams are available

  Scenario: Listing my teams
    When I run `lc team list`
    Then the output should match /[\w-]+/

  Scenario: Listing all teams
    When I run `lc team list --no-mine`
    Then the output should match /[\w-]+/
