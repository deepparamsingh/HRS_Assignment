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
${Ccookies_settings}      css:#onetrust-pc-btn-handler
${login}        //img[contains(@alt,'login')]//preceding-sibling::span
${userEmail}        css:#email
${userPass}     css:#password
${loginButton}      //button[contains(@class,'Button_Primary')]//span[normalize-space()='Log in']





*** Keywords ***

Fill the login Form
    [Arguments]     ${email}     ${valid_password}
    wait until element is visible    ${Kc_username}       60
    Input Text          ${Kc_username}     ${email}
    wait until element is visible    ${Kc_password}    60
    Input Password      ${Kc_password}     ${valid_password}
    Click Button        ${Kc_loginBtn}
#    wait until location contains    asset-overview     60
#    wait until element is visible       ${profileName}       60





