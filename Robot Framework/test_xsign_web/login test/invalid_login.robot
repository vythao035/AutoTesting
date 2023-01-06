*** Settings ***
Test Setup    Open Browser To Login Page
Test Teardown   Close All Browsers
Resource    resource.robot
Library    SeleniumLibrary

*** Test Cases ***
Open Web and Verify Title
    Login Page Should Be Open

Invalid Username
    Input Username    ${INVALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Wait Until Element Is Visible  xpath:/html/body/div/div/div/div/div[1]/div/div[2]/div/div/form/div/div/div[4]/div/div/div

    ${message}=  Handle Alert   action = accept timeout=5
    Should Be Equal  ${message}  Vui lòng lại kiểm tra thông tin đăng nhập.



#Invalid Password
#    Input Username    ${VALID USER}
#    Input Password    ${INVALID PASSWORD}
#    Submit Credentials
#    Handle Alert
#    Alert Should Not Be Present
#    [Teardown]    Close Browser
