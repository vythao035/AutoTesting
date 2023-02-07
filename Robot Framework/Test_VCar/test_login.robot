*** Settings ***
Library  AppiumLibrary
Resource    resource.robot

*** Test Cases ***
Login UnSuccessful
    Open Android Test App
    Start App
    Input Username  ${INVALID_USER}
    Input Password  ${INVALID_PWD}
    Submit Credentials
    Sleep   3
    Page Should Contain Element     ${Login Alert}
    Page Should Contain Text        Đăng nhập không thành công!
    Capture Page Screenshot     unsuccessful_login.png

Login Successful
    Open Android Test App
    Start App
    Input Username  ${USER}
    Input Password  ${PWD}
    Submit Credentials
    Sleep   5
    Page Should Contain Element     ${Menu Button}

