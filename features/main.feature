Feature: Post article
  In order to learn how to emit json
  As a programmer who loves the command line
  I want to submit json from the command line

  Scenario: Tweet a gist
    Given we have a message in mind
    When I post the message
    Then the message should have been saved
