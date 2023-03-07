*** Settings ***
Resource    Features/GlobalResources.robot
Suite Setup    Open Browser And Maximize

*** Test Cases ***
Search Books via keyword with Language Filter
    Given User Is At Amazon Webpage
    When user searches for Keyword apple in Department Books
    And user filters to English Language
    And user sorts the result by Publication Date
    Then Results should be sorted by Publication Date