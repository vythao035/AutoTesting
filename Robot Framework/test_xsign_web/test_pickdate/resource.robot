*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}               http://171.244.173.203/xsign-admin
${BROWSER}              Firefox
${IMPLICIT WAIT}        2seconds
${VALID USER}           hni_manager
${VALID PASSWORD}       Xsign@HNI2021
${LOGIN URL}            ${SERVER}/login

${START DATE}           2021-12-12
${END DATE}             2021-12-24



*** Keywords ***
Login To WebSite
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    Wait Until Page Does Not Contain Element   id:basic_username

Open Browser To Login Page
    Open Browser    ${LOGIN URL} ${BROWSER}
    Maximize Browser Window

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

Pick Start DateTime Successful
    [Arguments]    ${start_time_element}
    ${start_time_value}=    Get Element Attribute   ${start_time_element}   value
    ${start_datetime}=  Convert Date    ${START DATE}   result_format=%d/%m/%Y
    Should Be Equal     ${start_time_value}     ${start_datetime}

Pick End DateTime Successful
    [Arguments]    ${end_time_element}
    ${end_time_value}=    Get Element Attribute   ${end_time_element}   value
    ${end_datetime}=  Convert Date    ${END DATE}   result_format=%d/%m/%Y
    Should Be Equal     ${end_time_value}     ${end_datetime}