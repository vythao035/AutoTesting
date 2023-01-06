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


    @{list_user_in_table}=  Create List

    WHILE    "${is_disable_next_button}" != "true"
        ${traffic_sign_table_element}=  Get Webelement  class:ant-table-container
        @{cols}=    Get Webelements     xpath:/html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[1]/table/thead/tr/th
        @{rows}=    Get Webelements     class:ant-table-row

        ${num_cols}=    Get Length  ${cols}
        ${num_rows}=    Get Length  ${rows}
#        ${num_cols_int}=    Convert To Integer  ${num_cols}
#        Log To Console  ${num_cols}
        FOR    ${c_idx}     IN RANGE   ${num_cols}
            ${col}=     Get From List     ${cols}     ${c_idx}
            ${c_title}=     Get Text   ${col}
            ${c_idx_xpaht}=     Evaluate        ${c_idx}+${1}
            IF    "${c_title}" == "Tài khoản"
                FOR     ${r_idx}     IN RANGE   ${num_rows}
                    ${r_idx_xpaht}=     Evaluate        ${r_idx}+${2}
                    ${row}=     Get From List     ${rows}     ${r_idx}
                    ${path}=    Catenate    /html/body/div[1]/div/section/div/div/div[2]/div[2]/div[1]/div/div/div/div/div[2]/table/tbody/tr[${r_idx_xpaht}]/td[${c_idx_xpaht}]
                    ${cell_element}=    Get Webelement  xpath:${path}
                    ${user_name}=   Get Text    ${cell_element}

#                    IF   ${user_name} IN ${list_user_in_table}
                    Append To List  ${list_user_in_table}   ${user_name}
                    ${list_user_in_table}=      Remove Duplicates   ${list_user_in_table}
                    Log To Console  ${list_user_in_table}
                    END
                END
            BREAK
            END
        BREAK
        END
        Click Element       ${next_page_button}
        ${is_disable_next_button}=  Get Element Attribute   ${next_page_button}     aria-disabled
        Log To Console      ${is_disable_next_button}
        sleep   2