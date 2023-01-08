*** Settings ***
Library  AppiumLibrary
Library  BuiltIn


*** Variables ***
${DEVICE_NAME}    emulator-5554
${ANDROID_APP}                ${CURDIR}/../app/xsign.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}

*** Test Cases ***
Open Android Test App
  open application  http://localhost:4723/wd/hub  deviceName=${DEVICE_NAME}
  ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
