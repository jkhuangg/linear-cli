Feature: Project List
  As a user
  I want to list projects
  So that I can see what projects are available

  Scenario: Listing my projects
    When I run `lc project list --mine`
    Then the output should match /Crying Game/

  Scenario: Listing all projects
    When I run `lc project list`
    Then the output should match /Crying Game/
