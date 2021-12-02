# Voxy Coding Challenge

Coding challenge for a Software Testing Engineer role at Voxy.
The task consists of designing test cases for Voxy's login homepage with no valid credentials.


Given the credential constraints, the automated tests simulate the following user behaviors:
- Login with invalid email/phone
- Login with nonexistent email/phone
- Entering an invalid activation code
- Entering invalid data on code activation form

The detailed description of the scenarios (in natural language) can be found on `features/gherkins`.

## Installation

Dependencies:
- Ruby
- Bundle
- Chrome and Chromedriver

Installing ruby packages:
```sh
bundle install
```

## Test execution

```sh
bundle exec cucumber
```
Use the mobile profile to execute with mobile resolution:

```sh
bundle exec cucumber -p mobile
```

## Test report

After the execution, a test report is generated at `results/report.html`. Screnshots can be found in the same folder.
