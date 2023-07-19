*** Settings ***
Library           AppiumLibrary    10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1

*** Variables ***
${perfecto_hub_url}     https://<your_cloud_name>.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}       <your_sec_token>
${bundleId}       com.apple.mobilenotes
${deviceid_iphone}   <your_device_id>

*** Test Cases ***
Demo test on iphone
    [Tags]    Perfeco  Device   iPhone
    [Teardown]   Close All Applications
    open test device and launch mobilenotes      iPhone
    sleep  9
    create a note
    rotate to lanscape
    sleep  9
    rotate to portrait
    goto home screen
    swipe to the right screen


*** keywords ***
open test device and launch mobilenotes
    [arguments]     ${devicemodel}
    run keyword if  '${devicemodel}'=='iPhone'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}    perfecto:deviceName=${deviceid_iphone}      perfecto:noReset=${True}   perfecto:bundleId=${bundleId}        perfecto:takesScreenshot=${True}              perfecto:screenshotOnError=${False}
    run keyword if  '${devicemodel}'=='Android'     open application    ${perfecto_hub_url}   perfecto:securityToken=${perfecto_token}    perfecto:deviceName=${deviceid_android}      perfecto:noReset=${True}   perfecto:browserName=mobileOS


create a note
    Click Element       xpath=//*[@label="New note"]
    input text         xpath=//*[@label="Note"]     test1234
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
