Feature: Validate counter and messages

    Scenario: Login Validate
        Given I have "emailField" and "passField" and "loginButton"
        When I fill the "emailField" field with "lucast@suamusica.com.br"
        When I fill the "passField" field with "123456"
        Then I tap the "loginButton" button
        Then I expect found "alert_text_login" "OK"
    Scenario: Validates when i click in add button
        When I tap the "add10" button 5 times
        Then I expect the counter to be "50"
        When I tap the "add10" button 5 times
        Then I expect the counter to be "100"
    Scenario: Validates when i click in subtract button
        When I tap the "subtract" button 5 times
        Then I expect the counter to be "-5"
    Scenario: Validates when i click in showDialog button
        When I tap the "increment" button 5 times
        Then I expect the counter to be "5" 
        When I tap the "showDialog" button 1 time
        Then I expect the counter to be "5"