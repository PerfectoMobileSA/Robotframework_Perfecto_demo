*** Settings ***
Library           AppiumLibrary    10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1       ${CURDIR}/testerr.json
Library           customErr.py
*** Variables ***
${perfecto_hub_url}        https://ps.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}          <your_sec_token>
*** Test Cases ***
Demo test on ipad
    [Tags]    Perfeco  Device   iPad
#    [Teardown]   Close All Applications
    open test device and launch browser      iPad
#    customErr.raise err
#    Sleep    5
    AppiumLibrary.Wait Until Page Contains Element    xpath=//*[@label="Timer"]
    AppiumLibrary.Page Should Contain Element          xpath=//*[@label="Timer"]
    AppiumLibrary.Click element           xpath=//*[@label="Timer"]

#    open test device and launch browser      second
#    Sleep    5
#    AppiumLibrary.Wait Until Page Contains Element    xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
#    AppiumLibrary.Page Should Contain Element          xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
#    AppiumLibrary.Click element           xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]

    open test device and launch browser      third
    Sleep    5
    AppiumLibrary.Wait Until Page Contains Element    xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
    AppiumLibrary.Page Should Contain Element          xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
    AppiumLibrary.Click element           xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]

    open test device and launch browser      one
    Sleep    5
    AppiumLibrary.Wait Until Page Contains Element    xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
    AppiumLibrary.Page Should Contain Element          xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
    AppiumLibrary.Click element           xpath=//*[@resource-id="io.perfecto.expense.tracker:id/layout_login_fields"]
*** keywords ***
open test device and launch browser
    [arguments]        ${devicemodel}
    run keyword if  '${devicemodel}'=='iPad'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}         perfecto:deviceName=9EA7B040212934AAFC32D27C7EE70117C2A088E5            perfecto:noReset=${True}             perfecto:bundleId=com.apple.mobiletimer           automationName=Appium
    run keyword if  '${devicemodel}'=='third'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}         perfecto:deviceName=R5CN308PMRW      perfecto:noReset=${True}                 perfecto:browserName=mobileOS            automationName=Appium               perfecto:appPackage=io.perfecto.expense.tracker       perfecto:takesScreenshot=${True}
    run keyword if  '${devicemodel}'=='second'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}         perfecto:deviceName=R5CN214ETQH      perfecto:noReset=${True}                 perfecto:browserName=mobileOS           automationName=Appium             perfecto:appPackage=io.perfecto.expense.tracker       perfecto:takesScreenshot=${True}
    run keyword if  '${devicemodel}'=='one'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}         perfecto:deviceName=RF8M329FK3X      perfecto:noReset=${True}                 perfecto:browserName=mobileOS          automationName=Appium              perfecto:appPackage=io.perfecto.expense.tracker       perfecto:takesScreenshot=${True}

