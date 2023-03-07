*** Settings ***
Resource    Features/GlobalResources.robot

*** Variables ***
${SignInPageTitle}    Amazon Sign-In
${ThereWasAProblemMessage}    There was a problem
${PasswordIncorrectMessage}    Your password is incorrect
${CannotFindAccountMessage}    We cannot find an account with that email address
${EnterEmailOrPhoneMessage}    Enter your email or mobile phone number
${EnterYourPasswordMessage}    Enter your password

${InvalidEmailAddress}    invalidemail@test.com
${IncorrectPassword}    IncorrectPassword123!