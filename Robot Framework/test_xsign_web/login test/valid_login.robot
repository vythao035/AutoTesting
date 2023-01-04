*** Settings ***
Suite Setup    Open Browser To Login
Suite Teardown    Close Browser
Test Setup    Go to login page
Test Template     Login with valid account
Resource    resource.robot

*** Test Cases ***
