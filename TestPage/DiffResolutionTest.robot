*** Settings ***
Documentation   Contains all test cases of Member page
Library         SeleniumLibrary
Library         ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Resource        ../Pages/Generic.robot
Resource        ../Pages/DashboardPage.robot
Resource        ../Pages/DepartmentPage.robot
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/LoginPage.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot
Resource        ../Pages/Admin_PanelPage.robot
Resource        ../Pages/PaginationPage.robot
Resource        ../Pages/DisconnectConnectorAPI.robot
Resource        ../Pages/UnselectAssetAPI.robot

#Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***

${URL}          https://debut-dev.debutinfotech.in/php-web-development
${browser_name}         firefox


# Define different screen resolutions
@{RESOLUTIONS}    375x812

${SCROLL_STEP}     1900    # Number of pixels to scroll at a time
${SCROLL_PAUSE}    0.5    # Pause time in seconds between scrolls
${THRESHOLD}    10

*** Keywords ***
Open Browser At Resolution
    [Arguments]    ${resolution}
    Open Browser    ${URL}    ${browser_name}
    ${width}=    Set Variable    ${resolution.split('x')[0]}
    ${height}=   Set Variable    ${resolution.split('x')[1]}
    Set Window Size    ${width}    ${height}
#    Maximize Browser Window  # Optional: You can comment this out if you don't want to maximize
    Log To Console   Opened browser at resolution: ${resolution}
#    Generic.Scroll the page till            5000
#    Generic.Scroll Window To End
    Sleep    5  # Wait for 2 seconds to observe the resolution



#Slow Scroll To Page Bottom
#    ${scroll_position}=    Set Variable    0
#    ${scroll_height}=    Get Scroll Height
#    WHILE    ${scroll_position} < ${scroll_height}
#        Execute Javascript    window.scrollBy(0, ${SCROLL_STEP});
#        ${scroll_position}=    Get Current Scroll Position
#        Sleep    ${SCROLL_PAUSE}
#        ${scroll_height}=    Get Scroll Height
#    END


Slow Scroll To Page Bottom
    ${scroll_position}=    Set Variable    0
    ${scroll_height}=    Get Scroll Height
    WHILE    ${scroll_position} + ${THRESHOLD} < ${scroll_height}
        Execute Javascript    window.scrollBy(0, ${SCROLL_STEP});
        ${new_scroll_position}=    Get Current Scroll Position
        Sleep    ${SCROLL_PAUSE}
        ${new_scroll_height}=    Get Scroll Height
        # Break loop if the scroll position and height do not change (for infinite scrolling pages)
        Run Keyword If    '${scroll_position}' == '${new_scroll_position}' and '${scroll_height}' == '${new_scroll_height}'      RETURN FROM KEYWORD
        ${scroll_position}=    Set Variable    ${new_scroll_position}
        ${scroll_height}=    Set Variable    ${new_scroll_height}
    END

Get Scroll Height
    ${scroll_height}=    Execute Javascript    return document.documentElement.scrollHeight;
    [Return]    ${scroll_height}

Get Current Scroll Position
    ${scroll_position}=    Execute Javascript    return window.pageYOffset;
    [Return]    ${scroll_position}

*** Test Cases ***
#Open Browser in Different Resolutions
#    FOR    ${resolution}    IN    @{RESOLUTIONS}
#        Open Browser At Resolution    ${resolution}
#        Close Browser
#    END
#
#
#
#
#Slow Scroll to Bottom of Page
#    FOR    ${resolution}    IN    @{RESOLUTIONS}
#        Open Browser At Resolution    ${resolution}
#        log to console      resolution :${resolution}
##        Close Browser
#    END
##    Maximize Browser Window
#    Slow Scroll To Page Bottom
##    sleep   10
#    Maximize Browser Window
#    Close Browser

Slow Scroll to Bottom of Page
    FOR    ${resolution}    IN    @{RESOLUTIONS}
        Open Browser At Resolution    ${resolution}
        log to console      resolution : ${resolution}
        Slow Scroll To Page Bottom
        Close Browser
    END