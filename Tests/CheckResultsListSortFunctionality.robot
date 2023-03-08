*** Settings ***
Resource    Features/GlobalResources.robot
Suite Setup    Open Browser And Maximize
Suite Teardown    Close Browser

*** Test Cases ***
Search Books via keyword with Language Filter
    Given user Is At Amazon Webpage
    When user searches for Keyword apple in Department Books
    And user filters to English Language
    And user sorts the result by Publication Date
    Then Results should be sorted by Publication Date