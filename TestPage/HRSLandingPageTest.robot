*** Settings ***
Documentation   Contains all test cases of Landing page
Library         SeleniumLibrary
Library         ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Resource        ../Pages/HRSGeneric.robot
Resource        ../Pages/HRSLandingPage.robot


Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link


*** Test Cases ***
Validate Succesful Login
    HRSLandingPage.Accept cookies
    HRSLandingPage.Click on the menu option
    HRSLandingPage.Click on change language option      Sprache
    HRSLandingPage.Select the relevant language     English
    HRSGeneric.Verify your current page location contains          language=en
    HRSLandingPage.Enter the location      Barcelona Catalonia
    HRSLandingPage.Select the location
    HRSLandingPage.Click on the datepicker
    HRSLandingPage.Click next month to find date
    HRSLandingPage.
    HRSLandingPage.

