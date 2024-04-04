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
Resource        ../Pages/HRSHotelListingPage.robot
Resource        ../Pages/HRSDetailsPage.robot


Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***
${Error_Message_Login}      //div[normalize-space()='You have successfully been logged in.']
${Shop_page_load}           //div[normalize-space()='You have successfully been logged out.']


*** Test Cases ***
Validate succesful login
    HRSLandingPage.Accept cookies
    HRSLandingPage.Click on the menu option
    HRSLandingPage.Click on change language option      Sprache
    HRSLandingPage.Select the relevant language     English
    HRSGeneric.Verify your current page location contains          language=en
    HRSLandingPage.Click on the login
    HRSLandingPage.Enter email ID          deepparamsingh@gmail.com
    HRSLandingPage.Enter password      Qwer@2024
    HRSLandingPage.Click on login button
    HRSLandingPage.Verify alert message     You have successfully been logged in.


Book hotel room
    HRSLandingPage.Accept cookies
    HRSLandingPage.Click on the menu option
    HRSLandingPage.Click on change language option      Sprache
    HRSLandingPage.Select the relevant language     English
    HRSGeneric.Verify your current page location contains          language=en
    HRSLandingPage.Click on the login
    HRSLandingPage.Enter email ID          deepparamsingh@gmail.com
    HRSLandingPage.Enter password      Qwer@2024
    HRSLandingPage.Click on login button
    HRSLandingPage.Verify alert message     You have successfully been logged in.
    HRSLandingPage.Enter the location      Barcelona Catalonia
    HRSLandingPage.Select the location
    HRSLandingPage.Click on the datepicker
    HRSLandingPage.Click next month to find date
    HRSLandingPage.Select Start date of the month     June    21
    HRSLandingPage.Select end date of the month     June    26
    HRSLandingPage.Click on search hotels
    HRSGeneric.Verify your current page location contains       Recommendations
    HRSHotelListingPage.Enter room price        60
    HRSHotelListingPage.Select hotel room
    sleep       ${yop_sleep}
    Switch Window   Bcnsporthostels
    HRSGeneric.Verify your current page location contains       detail
    HRSDetailsPage.Choose the room
    HRSDetailsPage.Choose the first room appers in the list
    HRSGeneric.Verify your current page location contains       book
    HRSGeneric.Verify your current page contains this text     Your contact data
    HRSDetailsPage.Select country code      +91
    HRSDetailsPage.Enter Phone number       9646289871