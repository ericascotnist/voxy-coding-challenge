Feature: User Login

Scenario Outline: Unsuccessful login with invalid email
    Given I'm on voxy's login page
    When I type the email <user_mail>
    Then the submit button should be disabled

    Examples:
    | user_mail             |
    | ""                    |
    | "invalid"             |
    | "invalid()@email.com" |

Scenario Outline: Unsuccessful login with invalid phone number
    Given I'm on voxy's login page
    When select mobile number login option
    And select "Brazil" as country
    And type the number <phone_number>
    Then the submit button should be disabled

    Examples:
    | phone_number  |
    | ""            |
    | "987654"      |
    | "string"      |

Scenario: Unsuccessful login with nonexistent email
    Given I'm on voxy's login page
    When I type the email "valid@email.com"
    And click on submit button
    Then an error message must be shown

Scenario: Unsuccessful login with nonexistent phone number
    Given I'm on voxy's login page
    When select mobile number login option
    And select "Brazil" as country
    And type the number "2140028922"
    And click on submit button
    Then an error message must be shown