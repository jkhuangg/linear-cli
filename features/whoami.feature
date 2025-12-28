Feature: WhoAmI
  As a user
  I want to know who I am logged in as
  So that I can verify my credentials

  Scenario: Displaying the current user
    When I run `lc whoami`
    Then the output should match /[\w-]+: .+ <.+>/
