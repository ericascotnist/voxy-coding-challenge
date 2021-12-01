Feature: Activate account

Scenario: Invalid activation code
    Given I'm on voxy's login page
    When I click the activation code option
    And set "000" as an activation code
    Then the code submit button should be disabled

Scenario: Nonexistent activation code
    Given I'm on voxy's login page
    When I click the activation code option
    And set "1111111111111111" as an activation code
    And fill the code activation form with valid data
    Then "nonexistent code" error message is shown

Scenario: Input an invalid email on code activation form
    Given I'm on voxy's login page
    When I click the activation code option
    And set "1111111111111111" as an activation code
    And fill the code activation form with invalid email
    Then "invalid email" error message is shown

Scenario: Input mismatching passwords on code activation form
    Given I'm on voxy's login page
    When I click the activation code option
    And set "1111111111111111" as an activation code
    And fill the code activation form with mismatching passwords
    Then "mismatching passwords" error message is shown

Scenario: Input a weak password on code activation form
    Given I'm on voxy's login page
    When I click the activation code option
    And set "1111111111111111" as an activation code
    And fill the code activation form with a weak password
    Then "password strength" error message is shown