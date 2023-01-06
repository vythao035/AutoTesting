*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${SERVER}           http://171.244.173.203/xsign-admin/

*** Test Cases ***
Login Request Test
    Create session  LoginSession    ${Server}
    ${data}=    Create dictionary  username=hni_manager     password=Xsign@HNI2021
    ${response}=    Post On Session  LoginSession  /login  ${data}
    Log To Console  ${response.status_code}