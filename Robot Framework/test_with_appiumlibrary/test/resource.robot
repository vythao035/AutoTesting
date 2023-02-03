*** Settings ***
Library  AppiumLibrary
Library  BuiltIn


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../demoapp/1.8.6(2).apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_APP_PACKAGE}        com.viettel.vcar
${ANDROID_APP_ACTIVITY}       com.connectedcar.MainActivity

${INVALID_USER}               thaontv
${INVALID_PWD}                Thao@123

${USER}                       demo@onroad.viettel.vn
${PWD}                        Viettel@2021!
#
#${USER}                       0976131843
#${PWD}                        Trung@123

${Login Username Field}         //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText
${Login Pwd Field}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText
${Login Button}                 //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]
${Login Alert}      //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView

${Menu Button}      //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]



*** Keywords ***
Open Android Test App
    Set Appium Timeout  10
    Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
    ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${ANDROID_APP_ACTIVITY}     noReset=${True}
    Sleep               2


Start App
    Wait Until Page Contains Element    ${Login Username Field}

Input Username
    [Arguments]     ${user}
    Input Text      ${Login Username Field}     ${user}

Input Password
    [Arguments]     ${pwd}
    Input Text      ${Login Pwd Field}      ${pwd}

Submit Credentials
    Click Element   ${Login Button}

Login
    Open Android Test App
    Start App
    Input Username  ${USER}
    Input Password  ${PWD}
    Submit Credentials
    Sleep   3
    Close Application

Open Personal Docmentation Management
    Open Android Test App
    Wait Until Page Contains Element    ${Menu Button}
    Click Element   ${Menu Button}
    Wait Until Page Contains Element    ${Docs Management}
    Click Element  ${Docs Management}
    Sleep  5