*** Settings ***
Resource    Features/GlobalResources.robot

*** Keywords ***
Navigate to Amazon Sign In Page
    Click Element    ${accountsAndListsLink}
    Title Should Be    ${SignInPageTitle}

Enter Email or Phone then continue
    [Arguments]    ${InputValue}
    Enter Text    ${emailOrNumberField}    ${InputValue}
    Wait And Click Element    ${continueButton}

Enter Password then sign in
    [Arguments]    ${Password}
    Enter Password    ${passwordField}    ${Password}
    Wait And Click Element    ${signInButton}

Account is invalid message should be displayed
    Page Should Contain    ${ThereWasAProblemMessage}
    Page Should Contain    ${CannotFindAccountMessage}
    Capture Page Screenshot

Skip Add mobile if present
    ${element_visible}=  Run Keyword And Return Status  Wait Until Element Is Visible    ${addPhoneSkipLink}
    Run Keyword If  '${element_visible}'=='True'  Click Element    ${addPhoneSkipLink}