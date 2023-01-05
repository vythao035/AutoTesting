*** Settings ***
Test Setup    Login To WebSite
Test Teardown    Close All Browsers

Resource    resource.robot
Library    DateTime
Library    Collections
Library    SeleniumLibrary

*** Test Cases ***
Manipulate Current Time test
    ${current_date}=    Get Current Date
    ${current_datetime}=    Convert Date    ${current_date}    datetime

    Log To Console      ${current_datetime}
    Log To Console      ${current_datetime.year}
    Log To Console      ${current_datetime.month}
    Log To Console      ${current_datetime.day}


Pick Start/End Date
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
        Log To Console  ${year}
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
        Log To Console  ${month}
        ${month_in_num}=    Get From Dictionary    ${MONTHS}    ${month}
        Log To Console  ${month_in_num}
        IF  ${month_in_num} == ${start_datetime.month}
            Click Element   ${i}
        BREAK
        END
    END

    # get all day element
    @{list_days}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_days}
        ${day}=    Get Text    ${i}
        Log To Console  ${day}
        IF  ${day} == ${start_datetime.day}
            Click Element   ${i}
        BREAK
        END
    END

    Pick Start DateTime Successful   xpath://*[@id="sideBar-date-picker"]

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
        Log To Console  ${year}
        IF  ${year} == ${end_datetime.year}
            Click Element   ${i}
        BREAK
        END
    END

#    Click Element   xpath:/html/body/div[2]/div/div/div/div[2]/div/div[2]/div/div[1]/div/button[1]
    @{list_months}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_months}
        ${month}=    Get Text    ${i}
        Log To Console  ${month}
        ${month_in_num}=    Get From Dictionary    ${MONTHS}    ${month}
        Log To Console  ${month_in_num}
        IF  ${month_in_num} == ${end_datetime.month}
            Click Element   ${i}
        BREAK
        END
    END


    # get all day element
    @{list_days}=  Get WebElements      xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr/td
    FOR     ${i}    IN      @{list_days}
        ${day}=    Get Text    ${i}
        Log To Console  ${day}
        IF  ${day} == ${end_datetime.day}
            Click Element   ${i}
        BREAK
        END
    END

    Pick End DateTime Successful   xpath:/html/body/div/div/section/div/div/div[1]/div/div[1]/div/div[1]/div/div[3]/input