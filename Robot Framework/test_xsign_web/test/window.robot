*** Settings ***
Library    SeleniumLibrary
Library    Collections

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
Get Window Name
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${name}=    Get Window Names    browser=CURRENT
    Log To Console  ${name}


Get Window Title
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${title}=    Get Window Titles    browser=CURRENT
    Log To Console  ${title}


Get Window Size
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${size}=    Get Window Size
    Log To Console  ${size}

    ${width}=   Get From List   ${size}     0
    Log To Console  ${width}
    ${height}=   Get From List   ${size}     1
    Log To Console  ${height}


Set Window Size
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${size}=    Get Window Size
    Log To Console  ${size}

    Set Window Size    width=400     height=500
    ${custom_size}=    Get Window Size
    Log To Console  ${custom_size}

    ${height}=  Get From List   ${custom_size}  1
    Should Be Equal As Strings   ${height}   500


Get Window Position
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${position}=    Get Window Position
    Log To Console  ${position}


Get Window Identifiers
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${identifiers}=    Get Window Identifiers  browser=CURRENT
    Log To Console  ${identifiers}


Get Location
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${location}=    Get Location
    Log To Console  ${location}


Get Browser Ids
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    ${browser_ids}=    Get Browser Ids
    Log To Console  ${browser_ids}


Log Location
    Open Browser        url=${REPO_URL}   browser=Chrome   executable_path=./driver/chromedriver
    Log Location
#    ${location}=    Get Location
#    Log To Console  ${location}

