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


*** Variables ***
${Accept_all_cookies}      css:#onetrust-accept-btn-handler
${Cookies_settings}      css:#onetrust-pc-btn-handler
${login}        //img[contains(@alt,'login')]//preceding-sibling::span
${userEmail}        css:#email
${userPass}     css:#password
${loginButton}      //button[contains(@class,'Button_Primary')]//span[normalize-space()='Log in']


${hamBurger}        //img[@alt='menu']



${search_location}      css:span[title='Location, hotel, region, address, post code']
${select_location}      (//li[contains(@class,'DestinationList_suggestionItem')])[1]
${next_month}       //div[contains(@class,'Calendar_monthsDesktop')]//img

*** Keywords ***


Accept cookies
    wait until element is visible   ${Accept_all_cookies}    60
    wait until element is enabled    ${Accept_all_cookies}    60
    Click Element       ${Accept_all_cookies}

Click on the menu option
    wait until element is visible    ${hamBurger}     60
    wait until element is enabled    ${hamBurger}     60
    Click Element        ${hamBurger}

Click on change language option
    [Arguments]    ${option}
    wait until element is visible   //span[normalize-space()='${option}']    60
    wait until element is enabled   //span[normalize-space()='${option}']     60
    Click Element        //span[normalize-space()='${option}']
#Sprache

Select the relevant language
    [Arguments]    ${option}
    wait until element is visible   //div[normalize-space()='${option}']    60
    wait until element is enabled   //div[normalize-space()='${option}']     60
    Click Element        //div[normalize-space()='${option}']
#English

Enter the location
    [Arguments]    ${option}        ${location}
    wait until element is visible   ${search_location}    60
    wait until element is enabled   ${search_location}     60
    Click Element       ${search_location}
    Clear Element Text      ${search_location}
    input text      ${search_location}     ${location}

Select the location
    wait until element is visible   ${select_location}   60
    wait until element is enabled   ${select_location}     60
    Click Element        ${select_location}
