Feature: Issue List
  As a user
  I want to list issues
  So that I can see what I need to work on

  Scenario: Listing my issues
    When I run `lc issue list`
    Then the output should match /[\w-]+/

  Scenario: Listing all issues
    When I run `lc issue list --no-mine`
    Then the output should match /[\w-]+/

  Scenario: Listing specific issue
    When I run `lc issue list NOCRY-123`
    Then the exit status should be 66
    And the output should match /Record not found/
