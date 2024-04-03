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


*** Variables ***
${price_input}      css:#priceInput


*** Keywords ***


Enter room price
    [Arguments]     ${price}
    wait until element is visible   ${price_input}    60
    wait until element is enabled   ${price_input}     60
    input text      ${price_input}    ${price}
    sleep   ${search_sleep}

Sort the list by
    wait until element is visible   //span[normalize-space()='Price']   60
    wait until element is enabled   //span[normalize-space()='Price']     60
    Click Element        //span[normalize-space()='Price']

Select hotel room
    wait until element is visible   (//span[normalize-space()='Hotel details'])[1]   60
    wait until element is enabled   (//span[normalize-space()='Hotel details'])[1]     60
    Click Element       (//span[normalize-space()='Hotel details'])[1]