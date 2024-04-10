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
${Accept_all_cookies}      //button[@id='onetrust-accept-btn-handler']
${Cookies_settings}      css:#onetrust-pc-btn-handler
${login}        //img[contains(@alt,'login')]//preceding-sibling::span
${userEmail}        css:#email
${userPass}     css:#password
${loginButton}      //button[contains(@class,'Button_Primary')]//span[normalize-space()='Log in']


${hamBurger}        //img[@alt='menu']



${search_location}      css:span[title='Location, hotel, region, address, post code']
${input_location}      css:#DestinationSearchInput
${select_location}      (//li[contains(@class,'DestinationList_suggestionItem')])[1]
${date_Picker}      css:#DatePickerOpener
${next_month}       //div[contains(@class,'Calendar_monthsDesktop')]//img

${search_hotels}     //span[normalize-space()='Search hotels']

*** Keywords ***
Click on the login
    wait until element is visible   ${login}     60
    wait until element is enabled   ${login}     60
    Click Element       ${login}

Enter email ID
    [Arguments]     ${email}
    wait until element is visible   ${userEmail}    60
    wait until element is enabled   ${userEmail}     60
    input text      ${userEmail}   ${email}

Enter password
    [Arguments]     ${pass}
    wait until element is visible   ${userPass}    60
    wait until element is enabled   ${userPass}     60
    input text      ${userPass}   ${pass}

Click on login button
    wait until element is visible  ${loginButton}     60
    wait until element is enabled   ${loginButton}     60
    Click Element       ${loginButton}


Accept cookies
    wait until element is visible   ${Accept_all_cookies}    60
    wait until element is enabled    ${Accept_all_cookies}    60
    Click Element       ${Accept_all_cookies}
    sleep   ${search_sleep}

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
    [Arguments]     ${location}
    wait until element is visible   ${search_location}    60
    wait until element is enabled   ${search_location}     60
    Click Element       ${search_location}
    Clear Element Text      ${input_location}
    input text      ${input_location}    ${location}
    sleep       ${search_sleep}

Select the location
    wait until element is visible   ${select_location}   60
    wait until element is enabled   ${select_location}     60
    Click Element        ${select_location}

Click on the datepicker
    wait until element is visible   ${date_Picker}   60
    wait until element is enabled   ${date_Picker}     60
    Click Element        ${date_Picker}

Click next month to find date
    wait until element is visible   ${next_month}   60
    wait until element is enabled   ${next_month}     60
    Click Element        ${next_month}

Select Start date of the month
    [Arguments]    ${month}        ${date}
    wait until element is visible   //div[contains(@class, 'Calendar_monthsDesktop')]//div[contains(@class, 'Month_container')]//div[contains(@class, 'Month_title')and contains(text(), '${month}')]//following::div[contains(@class,'Day_container')and contains(text(), '${date}')]   60
    wait until element is enabled   //div[contains(@class, 'Calendar_monthsDesktop')]//div[contains(@class, 'Month_container')]//div[contains(@class, 'Month_title')and contains(text(), '${month}')]//following::div[contains(@class,'Day_container')and contains(text(), '${date}')]     60
    Click Element        //div[contains(@class, 'Calendar_monthsDesktop')]//div[contains(@class, 'Month_container')]//div[contains(@class, 'Month_title')and contains(text(), '${month}')]//following::div[contains(@class,'Day_container')and contains(text(), '${date}')]

Select end date of the month
    [Arguments]    ${month}        ${date}
    wait until element is visible   //div[contains(@class, 'Calendar_monthsDesktop')]//div[contains(@class, 'Month_container')]//div[contains(@class, 'Month_title')and contains(text(), '${month}')]//following::div[contains(@class,'Day_container')and contains(text(), '${date}')]   60
    wait until element is enabled   //div[contains(@class, 'Calendar_monthsDesktop')]//div[contains(@class, 'Month_container')]//div[contains(@class, 'Month_title')and contains(text(), '${month}')]//following::div[contains(@class,'Day_container')and contains(text(), '${date}')]     60
    Click Element        //div[contains(@class, 'Calendar_monthsDesktop')]//div[contains(@class, 'Month_container')]//div[contains(@class, 'Month_title')and contains(text(), '${month}')]//following::div[contains(@class,'Day_container')and contains(text(), '${date}')]

Click on search hotels
    wait until element is visible   ${search_hotels}   60
    wait until element is enabled   ${search_hotels}     60
    Click Element        ${search_hotels}

Verify alert message
    [Arguments]    ${option}
    wait until element is visible   //div[normalize-space()='${option}']   60
    wait until element is not visible   //div[normalize-space()='${option}']   60


