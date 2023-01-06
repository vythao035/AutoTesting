*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${SERVER}           	http://171.244.173.203/x-sign-admin-ws/
${VALID USER}           hni_manager
${VALID PASSWORD}       Xsign@HNI2021
${INVALID USER}         hni
${INVALID PASSWORD}     XsignHNI2021

*** Test Cases ***
Login Successful Request Test
    Create Session  login_session   ${SERVER}
    ${data}=    Create dictionary  username=${VALID USER}     password=${VALID PASSWORD}
    ${header}=  Create dictionary   Content-Type=application/json
    ${resp}=    POST On Session  login_session  /login  json=${data}    headers=${header}
    ${token_list}=   Get Value From Json     ${resp.json()}     token
    ${token}=   Get From List   ${token_list}   0
    Log To Console  ${token}
    Status Should Be  200  ${resp}


Login UnSuccessful Request Test
    Create Session  login_session   ${SERVER}
    ${data}=    Create dictionary  username=${INVALID USER}     password=${VALID PASSWORD}
    ${header}=  Create dictionary   Content-Type=application/json
    ${resp}=    POST On Session  login_session  /login  json=${data}    headers=${header}   expected_status=400
    Log To Console  ${resp}
