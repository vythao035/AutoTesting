*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}               http://171.244.173.203/xsign-admin
${LOGIN_URL}            ${SERVER}/login


*** Test Cases ***
Basic Open Browser Firefox
    Open Browser        ${LOGIN_URL}
    sleep   2
    Close All Browsers

Basic Open Browser Chrome
    Open Browser        url=${LOGIN_URL}   browser=Chrome   executable_path=./driver/chromedriver
    sleep   2
    Close All Browsers

Open Browser Headless Firefox
    Open Browser        ${LOGIN_URL}    browser=Headless Firefox
    sleep   2
    Close All Browsers

Open Browser Headless Chrome
    Open Browser        ${LOGIN_URL}    browser=Headless Chrome   executable_path=./driver/chromedriver
    sleep   2
    Close All Browsers


