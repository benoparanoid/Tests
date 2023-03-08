*** Settings ***
Resource    Features/GlobalResources.robot
Suite Setup    Open Browser And Maximize
Suite Teardown    Close Browser

*** Test Cases ***
Login using invalid account
    Given user is at Amazon webpage
    When user logs in using an invalid account
    Then cannot find the account message should be displayed

Login using valid account
    [Teardown]    Signout of Amazon
    Given user is at Amazon webpage
    When user logs in using a valid account
    Then login should be successful