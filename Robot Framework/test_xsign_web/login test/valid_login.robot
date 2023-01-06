*** Settings ***
Resource    resource.robot
Library    SeleniumLibrary

*** Test Cases ***
Open Web and Verify Title
    Open Browser To Login Page
    Login Page Should Be Open
    [Teardown]    Close Browser

Login Successful Test
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    sleep   1
    Wait Until Page Does Not Contain Element   id:basic_username
    Welcome Page Should Be Open
    sleep   3
    [Teardown]    Close Browser

Login UnSuccessful Test
    Open Browser To Login Page
    Input Username  ${INVALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    sleep   1
#    Wait Until Page Does Not Contain Element   id:basic_username
    Welcome Page Should Be Open
    sleep   3
    [Teardown]    Close Browser