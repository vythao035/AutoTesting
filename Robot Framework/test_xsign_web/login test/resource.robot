*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}               http://171.244.173.203/xsign-admin
${BROWSER}              Firefox
${IMPLICIT WAIT}        2seconds
${VALID USER}           hni_manager
${VALID PASSWORD}       Xsign@HNI2021
${LOGIN URL}            ${SERVER}/login
${INVALID USER}         hni
${INVALID PASSWORD}     XsignHNI2021

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL} ${BROWSER}
    Maximize Browser Window
#    Set Selenium Speed      ${DELAY}
#    Set Selenium Implicit Wait      ${IMPLICIT WAIT}

Login Page Should Be Open
    ${GET TITLE}=   Get Title
    Title Should Be     Login - XSign Management

Input Username
    [Arguments]    ${user}
    Input Text  id:basic_username  ${user}

Input Password
    [Arguments]    ${pwd}
    Input Text  id:basic_password    ${pwd}

Submit Credentials
    Click Button    Đăng nhập

Welcome Page Should Be Open
    Location Should Be  ${SERVER}
    Title Should Be    X-Sign management
