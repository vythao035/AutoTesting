*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}               http://171.244.173.203/xsign-admin
${BROWSER}              Firefox
${IMPLICIT WAIT}        2seconds
${VALID USER}           hni_manager
${VALID PASSWORD}       Xsign@HNI2021
${LOGIN URL}            ${SERVER}/login

${START DATE}           2021-12-12
${END DATE}             2021-12-24



*** Keywords ***
Login And Pick DateTime
    Login To WebSite
    Pick DateTime

Pick DateTime
    ${start_datetime}=  Convert Date    ${START DATE}   datetime
    ${end_datetime}=  Convert Date    ${END DATE}   datetime

    ${MONTHS}=      Create Dictionary   Jan=1   Feb=2    Mar=3   Apr=4   May=5   Jun=6   Jul=7   Aug=8   Sep=9   Oct=10  Nov=11     Dec=12
    # clear default datetime
    Click Element   xpath:/html/body/div/div/section/div/div/div[1]/div/div[1]/div/div[1]/div/span[2]

    # click start datetime
    Click Element   xpath://*[@id="sideBar-date-picker"]
    sleep   1
    ## TODO: thay sleep bang wait

    # click start year
    Click Element   css:div.ant-picker-panel:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(2)
    # get all year elements
    @{list_years}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_years}
        ${year}=    Get Text    ${i}
        IF  ${year} == ${start_datetime.year}
            Click Element   ${i}
        BREAK
        END
    END

    # click month
    Click Element   css:div.ant-picker-panel:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)

    # get all month element
    @{list_months}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_months}
        ${month}=    Get Text    ${i}
        ${month_in_num}=    Get From Dictionary    ${MONTHS}    ${month}
        IF  ${month_in_num} == ${start_datetime.month}
            Click Element   ${i}
        BREAK
        END
    END

    # get all day element
    @{list_days}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_days}
        ${day}=    Get Text    ${i}
        IF  ${day} == ${start_datetime.day}
            Click Element   ${i}
        BREAK
        END
    END


    # click end datetime
    Click Element   xpath:/html/body/div[1]/div/section/div/div/div[1]/div/div[1]/div/div[1]/div/div[3]/input
    sleep   1
    ## TODO: thay sleep bang wait

    # click end year
    Click Element   css:div.ant-picker-panel:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(2)
    # get all year elements
    @{list_years}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_years}
        ${year}=    Get Text    ${i}
        IF  ${year} == ${end_datetime.year}
            Click Element   ${i}
        BREAK
        END
    END

    @{list_months}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_months}
        ${month}=    Get Text    ${i}
        ${month_in_num}=    Get From Dictionary    ${MONTHS}    ${month}
        IF  ${month_in_num} == ${end_datetime.month}
            Click Element   ${i}
        BREAK
        END
    END


    # get all day element
    @{list_days}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_days}
        ${day}=    Get Text    ${i}
        IF  ${day} == ${end_datetime.day}
            Click Element   ${i}
        BREAK
        END
    END


Login To WebSite
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    Wait Until Page Does Not Contain Element   id:basic_username

Open Browser To Login Page
    Open Browser    ${LOGIN URL} ${BROWSER}
    Maximize Browser Window

Login Page Should Be Open
    ${GET TITLE}=   Get Title
    Title Should Be     Login - XSign Management

Input Username
    [Arguments]    ${user}
    Input Text  id:basic_username  ${user}

Input Password
    [Arguments]    ${pwd}
    Input Text  id:basic_password    ${pwd}

Submit Credentials
    Click Button    Đăng nhập

Welcome Page Should Be Open
    Location Should Be  ${SERVER}
    Title Should Be    X-Sign management

Pick Start DateTime Successful
    [Arguments]    ${start_time_element}
    ${start_time_value}=    Get Element Attribute   ${start_time_element}   value
    ${start_datetime}=  Convert Date    ${START DATE}   result_format=%d/%m/%Y
    Should Be Equal     ${start_time_value}     ${start_datetime}

Pick End DateTime Successful
    [Arguments]    ${end_time_element}
    ${end_time_value}=    Get Element Attribute   ${end_time_element}   value
    ${end_datetime}=  Convert Date    ${END DATE}   result_format=%d/%m/%Y
    Should Be Equal     ${end_time_value}     ${end_datetime}