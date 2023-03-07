*** Settings ***
Resource    Features/GlobalResources.robot
Suite Setup    Open Browser And Maximize

*** Test Cases ***
Search Books via keyword with Language Filter
    Given User Is At Amazon Webpage
    When user searches for Keyword apple in Department Books
    And user filters to English Language
    Then Results displays 16 items for search results with more than 16 items
    And Pagination should be displayed