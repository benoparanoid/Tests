*** Settings ***
Resource    Features/GlobalResources.robot

*** Keywords ***
Open Browser and Maximize
    Open Browser    https://www.google.com  ${Browser}
    Maximize Browser Window
    Sleep    2000ms

#Workaround since captcha is triggerring when directly navigating to amazon url
Search and select Amazon on google
    Go To    https://www.google.com
    Enter Text    //*[@title="Search"]    Amazon
    Press Keys    //*[@title="Search"]    ENTER
    Wait And Click Element    //*[contains(text(), "Amazon.com")]

Webpage title should contain text
    [Arguments]    ${expected}
    Capture Page Screenshot
    ${actual}=    Get Title
    Should Contain    ${actual}   ${expected}

Enter Text
    [Arguments]    ${Locator}    ${Value}
    Wait Until Element Is Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Enter Password
    [Arguments]    ${Locator}    ${Value}
    Wait Until Element Is Visible    ${Locator}
    Input Password    ${Locator}    ${Value}

Wait and click element
    [Arguments]    ${Locator}
    Wait Until Element Is Visible    ${Locator}
    Click Element    ${Locator}

Scroll to Element
    [Arguments]    ${Locator}
    Scroll Element Into View    ${Locator}
    ${element}    Get WebElement    ${Locator}
    Execute JavaScript    window.scroll(0, ${element.location['y']} - (window.innerHeight / 2))
    Capture Page Screenshot

Convert Date Month to mm
    [Arguments]    ${month}
    IF    "${month}" == "Jan" or "${month}" == "January"
        ${convertedMonth}=    Set Variable    01
    ELSE IF    "${month}" == "Feb" or "${month}" == "February"
        ${convertedMonth}=    Set Variable    02
    ELSE IF    "${month}" == "Mar" or "${month}" == "March"
        ${convertedMonth}=    Set Variable    03
    ELSE IF    "${month}" == "Apr" or "${month}" == "April"
        ${convertedMonth}=    Set Variable    04
    ELSE IF    "${month}" == "May" or "${month}" == "May"
        ${convertedMonth}=    Set Variable    05
    ELSE IF    "${month}" == "Jun" or "${month}" == "June"
        ${convertedMonth}=    Set Variable    06
    ELSE IF    "${month}" == "Jul" or "${month}" == "July"
        ${convertedMonth}=    Set Variable    07
    ELSE IF    "${month}" == "Aug" or "${month}" == "August"
        ${convertedMonth}=    Set Variable    08
    ELSE IF    "${month}" == "Sep" or "${month}" == "September"
        ${convertedMonth}=    Set Variable    09
    ELSE IF    "${month}" == "Oct" or "${month}" == "October"
        ${convertedMonth}=    Set Variable    10
    ELSE IF    "${month}" == "Nov" or "${month}" == "November"
        ${convertedMonth}=    Set Variable    11
    ELSE IF    "${month}" == "Dec" or "${month}" == "December"
        ${convertedMonth}=    Set Variable    12
    END
    [Return]    ${convertedMonth}

Convert The Date
    [Arguments]    ${value}
    @{words}=	Split String	${value}    ${SPACE}
    ${list}=    Get Length    ${words}
    ${NewDate}=    Set Variable    ${EMPTY}
    IF    "${list}" == "3"
        ${Month}=    Get From List    ${words}    0
        ${Date}=    Get From List    ${words}    1
        ${Year}=    Get From List    ${words}    2
        ${Month}=    Convert Date Month to mm    ${Month}
        ${count}=    Get Length    ${Date}
        IF    "${count}" == "1"
            ${Date}=    Catenate    0${Date}
        END
        ${NewDate}=    Catenate    ${Year}-${Month}-${Date}
    END
    [Return]    ${NewDate}