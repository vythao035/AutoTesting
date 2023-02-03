*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}               https://github.com
${REPO_URL}            ${SERVER}/vythao035/AutoTesting/tree/master


*** Test Cases ***
Implicit Wait
    ${default_implicit_wait}=   Get Selenium Implicit Wait
    Set Selenium Implicit Wait  10s
    ${custom_implicit_wait}=    Get Selenium Implicit Wait
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    Click Element   xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[1]/span
    Click Element   xpath://*[@id="local-panel"]/ul/li[1]/tab-container/div[2]/div/div
    Capture Page Screenshot     filename=screenshot_when_click_button_code.png
    Close All Browsers






