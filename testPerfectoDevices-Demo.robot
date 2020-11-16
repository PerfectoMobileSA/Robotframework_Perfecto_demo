*** Settings ***
Library           AppiumLibrary    10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1

*** Variables ***
${perfecturl}     https://<your_cloud_name>.perfectomobile.com/nexperience/perfectomobile/wd/hub/fast
${token}          <your_perfecto_security_token>
${bundleId}       com.apple.mobilenotes
${deviceid_iphone}   <your_device_id>

*** Test Cases ***
Demo test on iphone
    [Tags]    Perfeco  Device   iPhone
    [Teardown]   Close All Applications
    open test device and launch mobilenotes      iPhone
    create a note
    rotate to lanscape
    sleep  9
    rotate to portrait
    goto home screen
    swipe to the right screen


*** keywords ***
open test device and launch mobilenotes
    [arguments]     ${devicemodel}
    run keyword if  '${devicemodel}'=='iPhone'     open application    ${perfecturl}   securityToken=${token}    deviceName=${deviceid_iphone}      noReset=True   bundleId=${bundleId}
    run keyword if  '${devicemodel}'=='Android'     open application    ${perfecturl}   securityToken=${token}    deviceName=${deviceid_android}      noReset=True   browserName=mobileOS


create a note
    click element  //*[@label="New note"]
    input text     //*[@label="note"]     test1234
    click element  //*[@label="Done"]


goto home screen
    ${time}=     convert to integer  -1
    background app    ${time}


swipe to the right screen
    PerfectoLibrary.swipe    80%   50%     20%    50%     3


rotate to lanscape
    rotate

rotate to portrait
    rotate    portrait