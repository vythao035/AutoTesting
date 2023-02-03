*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${SERVER}               https://github.com
${REPO_URL}            ${SERVER}/vythao035/AutoTesting/tree/master


*** Test Cases ***
Click Element UserName
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${default_implicit_wait}=   Get Selenium Implicit Wait
    Set Selenium Implicit Wait  10s
    ${custom_implicit_wait}=    Get Selenium Implicit Wait
    Click Element    xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[1]/span
    Capture Page Screenshot     filename=screenshot_when_click_button_code.png
    Close All Browsers

Capture Page Screenshot When Click Button Code
    Open Browser        url=${REPO_URL}   browser=Headless Chrome   executable_path=./driver/chromedriver
    Click Element    xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[1]/span
    Capture Page Screenshot     filename=screenshot_when_click_button_code.png
    Close All Browsers

Capture Element Screenshot Button Code
    Open Browser        url=${REPO_URL}   browser=Headless Chrome   executable_path=./driver/chromedriver
    Click Element    xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[1]/span
    Capture Element Screenshot  xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[1]/span     filename=screenshot_button_code.png
    Close All Browsers







