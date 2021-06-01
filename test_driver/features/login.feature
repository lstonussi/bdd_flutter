Feature: Validate Login

    Scenario: Login Validate OK
        Given I have "emailField" and "passField" and "loginButton"
        When I fill the "emailField" field with "lucast@suamusica.com.br"
        When I fill the "passField" field with "1234561"
        Then I tap the "loginButton" button
        Then I expect found "alert_text_login" "OK"
    Scenario: Login Validate NOK
        Given I have "emailField" and "passField" and "loginButton"    
        When I fill the "emailField" field with "wrongemail.com"
        When I fill the "passField" field with "00000"
        Then I tap the "loginButton" button
        Then I expect found "alert_text_login" "NOK"