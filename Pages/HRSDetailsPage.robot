*** Settings ***
Documentation   Contains all keyword of Landing page
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


*** Variables ***
${chooseRoom_btn}      //div[contains(@class,'HeaderPrice_container')]//span[@data-test='SelectRoomButton_span']


*** Keywords ***


Choose the room
    wait until element is visible   ${chooseRoom_btn}   60
    wait until element is enabled   ${chooseRoom_btn}     60
    Click Element        ${chooseRoom_btn}

Choose the first room appers in the list
    wait until element is visible   (//span[normalize-space()='Booking'])[1]   60
    wait until element is enabled   (//span[normalize-space()='Booking'])[1]     60
    Click Element        (//span[normalize-space()='Booking'])[1]
