*** Settings ***
Resource    resource.robot

*** Test Cases ***
Open Web and Verify Title
    Open Browser To Login Page
    Login Page Should Be Open

Valid Login
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    Wait Until Page Does Not Contain Element   id:basic_username
    Welcome Page Should Be Open
    [Teardown]    Close Browser