*** Settings ***
Resource    Features/GlobalResources.robot

*** Variables ***
${accountsAndListsLink}    //a[@id="nav-link-accountList"]
${departmentDropdownSelect}    //select[@id="searchDropdownBox"]
${searchField}    //input[@id="twotabsearchtextbox"]
${searchSubmitButton}    //input[@id="nav-search-submit-button"]
${signOutLink}    id="nav-item-signout"