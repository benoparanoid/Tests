*** Settings ***
Resource    Features/GlobalResources.robot


*** Keywords ***
Select a filter for the results list
    [Arguments]    ${FilterList}    ${FilterValue}
    ${checkbox}=    Set Variable    //div[@id="filters"]//*[contains(text(), "${FilterValue}")]/../following-sibling::ul[1]//*[contains(text(), "${FilterList}")]
    Scroll To Element    ${checkbox}
    Wait And Click Element    ${checkbox}

Get the number of displayed search results
    Wait Until Element Is Visible    ${searchResultsIndividualItemList}
    ${count}=    Get Element Count    ${searchResultsIndividualItemList}
    ${count}=    Convert To Integer    ${count}
    [Return]    ${count}

Get total number of search results
    ${text}=    Get Text    ${totalNumberOfResultsText}
    ${text}=    Replace String    ${text}    results for    ${EMPTY}
    ${text}=    Replace String    ${text}    1-16 of over    ${EMPTY}
    ${text}=    Replace String    ${text}    1-16 of    ${EMPTY}
    ${text}=    Replace String    ${text}    ,    ${EMPTY}
    ${text}=    Remove String    ${text}    TRIM
    ${number}=    Convert To Integer    ${text}
    [Return]    ${number}

Sort search results
    [Arguments]    ${Category}
    Wait Until Element Is Visible    ${sortBySelectButton}
    Select From List By Label    ${sortBySelectButton}    ${Category}

Extract Date from Author and Publish Date Text
    [Arguments]    ${text}
    Log    ${text}
    ${text}=    Get Substring    ${text}    -12
    ${text}=	Strip String	${text}	   mode=left
    ${text}=    Replace String    ${text}    ,    ${EMPTY}
    ${date}=    Convert The Date     ${text}
    Log    ${date}    # Output: Dec 2, 2024
    [Return]    ${date}

List should be sorted by Publication Date
    [Arguments]    ${Locator}
    Wait Until Element Is Visible    ${Locator}
    Wait Until Element Is Visible    ${pagination}
    ${dates}=    Create List
    ${elements}=    Get WebElements    ${Locator}
    ${elementLength}=    Get Length    ${elements}
    Log    ${elementLength}
    FOR    ${element}    IN    @{elements}
        ${date}=    Get Text    ${element}
        Log    ${date}
        ${date}=    Extract Date from Author and Publish Date Text    ${date}
        IF    "${date}" != "${EMPTY}"
            Append To List    ${dates}    ${date}
        END
    END
    ${unsorted}=    Set Variable    ${dates}
    Log List    ${dates}
    Sort List    ${dates}
    Log List    ${dates}
    Should Be Equal    ${dates}    ${unsorted}
    Close Browser