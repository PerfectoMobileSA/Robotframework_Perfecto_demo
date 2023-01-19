*** Settings ***
Library           AppiumLibrary    10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1

*** Variables ***
${perfecto_hub_url}     https://<your_cloud_name>.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}       <your_perfecto_security_token>

${bundleId}       com.apple.reminders

*** Test Cases ***
Demo test on iphone
    [Tags]    Perfeco  Device   iPhone
    [Teardown]   Close All Applications
    open test device and launch reminder      iPhone
    sleep  30
    goto home screen
    sleep  30
    rotate to lanscape
    sleep  30
    rotate to portrait
    sleep  30
    goto home screen
    sleep  30
    swipe to the right screen


*** keywords ***
open test device and launch reminder
    [arguments]     ${devicemodel}
    run keyword if  '${devicemodel}'=='iPhone'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}         perfecto:noReset=${True}   perfecto:bundleId=${bundleId}        perfecto:takesScreenshot=${True}              perfecto:screenshotOnError=${False}       perfecto:useVirtualDevice=${True}             perfecto:platformName=iOS       perfecto:platformVersion=16.1       perfecto:manufacturer=Apple        perfecto:model=iPhone Xs Max
    run keyword if  '${devicemodel}'=='Android'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}          perfecto:noReset=${True}   perfecto:browserName=mobileOS


launch remidner and dismiss msgbox
    click element  //AppiumAUT/XCUIElementTypeApplication[1]/XCUIElementTypeWindow[11]/XCUIElementTypeOther[3]/XCUIElementTypeAlert[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]/XCUIElementTypeScrollView[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[3]
    sleep  10
    click element  //AppiumAUT/XCUIElementTypeApplication[1]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]
    sleep  10
    input text         //AppiumAUT/XCUIElementTypeApplication[1]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeTextField[1]     test1234
    sleep  10
    click element      xpath=//*[@label="Done"]
goto home screen
    ${time}=     convert to integer  -1
    background app    ${time}


swipe to the right screen
    PerfectoLibrary.swipe    80%   50%     20%    50%     3


rotate to lanscape
    rotate

rotate to portrait
    rotate    portrait
