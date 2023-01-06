*** Settings ***
Test Setup    Login And Pick DateTime
Test Teardown    Close All Browsers

Resource    resource.robot
Library    DateTime
Library    Collections
Library    SeleniumLibrary
Library    String

*** Test Cases ***
Consistency User Between Trips Table and CheckBox
    ${next_page_button}=    Get Webelement  xpath:/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[2]/ul/li[9]
    ${is_disable_next_button}=  Get Element Attribute   ${next_page_button}     aria-disabled


    ${list_user_in_table}=  Create List

    WHILE    ${is_disable_next_button} true
        ${traffic_sign_table_element}=  Get Webelement  class:ant-table-container
        @{cols}=    Get Webelements     xpath:/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[1]/table/thead/tr/th
        @{rows}=    Get Webelements     class:ant-table-row

        FOR     ${c_idx}    ${col} IN  ENUMERATE   @{cols}
            ${c_title}=     Get Text   ${col}
            IF    ${c_title}    ==  Tài khoản
                FOR     ${r_idx}    ${row} IN  ENUMERATE   @{rows}
                    ${path}=    Catenate    /html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[2]/table/tbody/tr[   ${r_idx} + 2 ]/td[{ ${c_idx} + 1
                    ${cell_element}=    Get Webelement  xpath:${path}
                    ${user_name}=   Get Text    ${cell_element}
                    IF    ${user_name} NOT IN ${list_user_in_table}
                        Append To List  ${list_user_in_table}   ${user_name}
                    END
                END
            END
        END
        Click Element ${next_page_button}
        sleep   2
    END