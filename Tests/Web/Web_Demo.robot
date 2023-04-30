*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library           RPA.Windows

Suite Setup         Open browser to application
Test Setup          Go to login page
Test Teardown       Sign out
Suite Teardown      Close Browser



*** Variables ***
${LOGIN URL}        https://automationplayground.com/crm/
${BROWSER}          Chrome
${SIGN IN LINK}     id:SignIn
${SIGN OUT LINK}    link:Sign Out
${TEST USER NAME}   test@qa.com
${TEST PASSWORD}    test_password
${USERNAME_FIELD}   id:email-id
${PASSWORD_FIELD}   id:password
${SUBMIT_BUTTON}   xpath://button[@id="submit-id"]





#robot -d .\Results\  -N "Web Demo tests"   ./Tests/Web/Web_Demo.robot
*** Test Cases ***
Valid Login
    Input Username    ${TEST USER NAME}
    Input Password    ${TEST PASSWORD}
    Submit Credentials
    Customers page should be open


*** Keywords ***
Open browser to application
    set selenium speed          1s
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be     Customer Service


Go to login page
    Click Element       ${SIGN IN LINK}
    Title Should Be     Customer Service - Login


Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Submit Credentials
    Click Button    ${SUBMIT_BUTTON} 

Customers page should be open
    Title Should Be         Customers
    Page Should Contain     Our Happy Customers

Sign out
    Click Element    ${SIGN OUT LINK}
    Page Should Contain     Signed Out
    Page Should Contain     Thank you for using the CRM. See you next time!
