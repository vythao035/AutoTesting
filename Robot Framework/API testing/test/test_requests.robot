*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary

*** Test Cases ***
Get Request
    [Tags]  get
    ${resp}=    GET     http://171.244.173.203/xsign-admin
    Status Should Be    OK  ${resp}


Get Request On Session
    [Tags]  get
    Create Session      test_session    http://171.244.173.203/xsign-admin
    ${resp}=    GET On Session  test_session      /login
    Status Should Be  OK  ${resp}