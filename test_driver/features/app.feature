Feature: Validate counter

    Scenario: Validates when i click in add button
        Given I have "add10"
        When I tap the "add10" button 5 times
        Then I expect the counter to be "50"
        When I tap the "add10" button 5 times
        Then I expect the counter to be "100"
    Scenario: Validates when i click in subtract button
        Given I have "subtract"
        When I tap the "subtract" button 5 times
        Then I expect the counter to be "-5"
    Scenario: Validates when i click in increment button
        Given I have "increment"
        When I tap the "increment" button 5 times
        Then I expect the counter to be "5" 
    Scenario: Validates when i click in showDialog button
        Given I have "increment"
        When I tap the "increment" button 5 times
        When I tap the "showDialog" button 1 time
        Then I expect the counter to be "5"