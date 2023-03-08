*** Settings ***
Resource    Features/GlobalResources.robot

*** Keywords ***
Account name should be displayed
    Capture Page Screenshot
    Wait Until Element Is Visible    ${accountsAndListsLink}
    ${actual}=    Get Text    ${accountsAndListsLink}
    Should Contain    ${actual}    Hello, ${AccountName}

Select Department
    [Arguments]    ${Department}
    Select From List By Label    ${departmentDropdownSelect}    ${Department}

Search keyword
    [Arguments]    ${Keyword}
    Enter Text    ${searchField}    ${Keyword}
    Wait And Click Element    ${searchSubmitButton}

Signout of Amazon
    Mouse Over    ${accountsAndListsLink}
    Wait And Click Element    ${signOutLink}