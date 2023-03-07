*** Settings ***
Resource    Features/GlobalResources.robot

*** Keywords ***
user logs in using an invalid account
    Navigate to Amazon Sign In Page
    Enter Email or Phone then continue    ${InvalidEmailAddress}

cannot find the account message should be displayed
    Account is invalid message should be displayed

user logs in using a valid account
    Navigate to Amazon Sign In Page
    Enter Email or Phone then continue    ${validEmailAddress}
    Enter Password Then Sign In    ${validPassword}
    Skip Add mobile if present

