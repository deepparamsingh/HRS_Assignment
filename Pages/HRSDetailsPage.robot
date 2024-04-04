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
${phone}         css:#phone
${chkBox}       css:#SmartPayCheckbox
#//span[@id='SmartPayCheckbox']//following-sibling::label

*** Keywords ***


Choose the room
    wait until element is visible   ${chooseRoom_btn}   60
    wait until element is enabled   ${chooseRoom_btn}     60
    Click Element        ${chooseRoom_btn}

Choose the first room appers in the list
    wait until element is visible   (//span[normalize-space()='Book now'])[1]   60
    wait until element is enabled   (//span[normalize-space()='Book now'])[1]     60
    Click Element        (//span[normalize-space()='Book now'])[1]


Select country code
    [Arguments]    ${code}
    wait until element is visible   css:#phoneCode  60
#    wait until element is enabled   css:#phoneCode     60
    Click Element        css:#phoneCode
    wait until element is visible   //li[@id='${code}']  60
    wait until element is enabled   //li[@id='${code}']    60
    Click Element       //li[@id='${code}']


Scroll within the element
    [Arguments]    ${option}
    Execute JavaScript    document.querySelector('tbody tr:nth-child(${option}) td:nth-child(1)').scrollIntoView(true);
    wait until element is visible       //span[normalize-space()='India (+91)']     60


Enter Phone number
    [Arguments]     ${phn}
    wait until element is visible   ${phone}     60
    wait until element is enabled   ${phone}     60
    input text     ${phone}    ${phn}
    sleep   ${search_sleep}

Mark the payment details checkbox
    wait until element is visible   ${chkBox}    60
    wait until element is enabled  ${chkBox}     60
    Click Element        ${chkBox}
