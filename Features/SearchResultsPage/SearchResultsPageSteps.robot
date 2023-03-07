*** Settings ***
Resource    Features/GlobalResources.robot

*** Keywords ***
user filters to ${Filter} Language
    Select a filter for the results list    ${Filter}    Language

Results displays 16 items for search results with more than 16 items
    ${TotalItems}=    Get total number of search results
    ${DisplayedItems}=    Get the number of displayed search results
    ${is_greater}    Set Variable If    ${TotalItems} > 16    True    False
    Should Be True    ${is_greater}
    Should Be Equal As Integers    ${DisplayedItems}    16

Pagination should be displayed
    Wait Until Element Is Visible    ${pagination}
    Capture Element Screenshot    ${pagination}

user sorts the result by ${Category}
    Sort search results    ${Category}

Results should be sorted by Publication Date
    List should be sorted by Publication Date    ${authorAndPublishDateText}

