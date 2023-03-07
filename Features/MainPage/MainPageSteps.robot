*** Settings ***
Resource    Features/GlobalResources.robot

*** Keywords ***
User is at Amazon webpage
    #Go To    ${AmazonMainPage}
    Search and select Amazon on google    #Workaround since captcha is triggerring when directly navigating to amazon url
    Webpage title should contain text    ${AmazonMainPageTitle}

login should be successful
    Webpage title should contain text    ${AmazonMainPageTitle}
    Account name should be displayed

user searches for Keyword ${Keyword} in Department ${Department}
    Select Department    ${Department}
    Search Keyword    ${Keyword}
