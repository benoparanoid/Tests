*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Library    DateTime
Library    re

#Global
Resource    Features/GlobalTestData.robot
Resource    Features/GlobalKeywords.robot

#MainPage
Resource    Features/MainPage/MainPageKeywords.robot
Resource    Features/MainPage/MainPageLocators.robot
Resource    Features/MainPage/MainPageSteps.robot
Resource    Features/MainPage/MainPageVariables.robot

#SignInPage
Resource    Features/SignInPage/SignInPageKeywords.robot
Resource    Features/SignInPage/SignInPageLocators.robot
Resource    Features/SignInPage/SignInPageSteps.robot
Resource    Features/SignInPage/SignInPageVariables.robot

#SearchResultsPage
Resource    Features/SearchResultsPage/SearchResultsPageKeywords.robot
Resource    Features/SearchResultsPage/SearchResultsPageLocators.robot
Resource    Features/SearchResultsPage/SearchResultsPageSteps.robot
Resource    Features/SearchResultsPage/SearchResultsPageVariables.robot

