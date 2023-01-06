*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${SERVER}           	http://171.244.173.203/x-sign-admin-ws/
${VALID USER}           hni_manager
${VALID PASSWORD}       Xsign@HNI2021


*** Keywords ***
Get Token When Login
    [Arguments]    ${user}  ${pwd}
    Create Session  session   ${SERVER}
    ${data}=    Create dictionary  username=${user}    password=${pwd}
    ${header}=  Create dictionary   Content-Type=application/json
    ${resp}=    POST On Session  session  /login  json=${data}    headers=${header}
    ${token_list}=   Get Value From Json     ${resp.json()}     token
    ${token}=   Get From List   ${token_list}   0
    [Return]    ${token}


*** Test Cases ***
Get All Users Request Test
    Create Session  session   ${SERVER}
    ${token}=   Get Token When Login    ${VALID USER}   ${VALID PASSWORD}
    ${header}=  Create dictionary   Content-Type=application/json   Authorization=${token}
    ${resp}=    Get On Session  session     /all-user      headers=${header}
    Status Should Be  200  ${resp}


Get Province Request Test
    Create Session  session   ${SERVER}
    ${token}=   Get Token When Login    ${VALID USER}   ${VALID PASSWORD}
    ${header}=  Create dictionary   Content-Type=application/json   Authorization=${token}
    ${resp}=    Get On Session  session     /provinces      headers=${header}
    ${resp_content}=    Get From List   ${resp.json()}    0
    ${province_name_list}=   Get Value From Json     ${resp_content}     province
    ${province_name}=   Get From List   ${province_name_list}    0
    Log To Console  ${province_name}
    Status Should Be  200  ${resp}
    Should Be Equal     ${province_name}    Ha Noi














