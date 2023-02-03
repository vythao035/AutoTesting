*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}               https://github.com
${REPO_URL}            ${SERVER}/vythao035/AutoTesting/tree/master

${USERNAME}             vythao035
${PWD}                  Tun@2412


*** Keywords ***
Sign In
    [Arguments]    ${user}  ${pwd}
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    Maximize Browser Window
    Set Selenium Implicit Wait  5s
    Click Element       xpath:/html/body/div[1]/div[1]/header/div/div[2]/div/div/div[2]/a
    Input Text          id:login_field  ${user}
    Input Password      id:password     ${pwd}
    Click Element       name:commit
    sleep   1

*** Test Cases ***
Get Session Id
    Open Browser        url=${REPO_URL}   browser=Headless Chrome   executable_path=./driver/chromedriver
    ${session_id}=  Get Session Id
    Log To Console  ${session_id}
    Close All Browsers


Get Cookie Before Login
    Open Browser        url=${REPO_URL}   browser=Headless Chrome   executable_path=./driver/chromedriver
    ${cookies}=  Get Cookies
    Log To Console  ${cookies}
    Close All Browsers


Get Cookie After Login
    Sign In     ${USERNAME}     ${PWD}
    ${cookies}=  Get Cookies
    Log To Console  ${cookies}
    Close All Browsers







