*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}           http://171.244.173.203/xsign-admin
${BROWSER}          Firefox
${DELAY}            0
${VALID USER}       hni_manager
${VALID PASSWORD}   Xsign@HNI2021
${LOGIN URL}        http://${SERVER}/login.html

*** Keywords ***
Open Browse To Login Page
    Open Browse     ${LOGIN URL} ${BROWSE}
    Maximize Browse Window
    Set Selenium Speed ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be     Login Page

Go To Login Page
    Go To   ${LOGIN URL}
    Login Page Should Be Open

Input Username
    Go To   ${username}
    Input Text username_field   ${usename}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
