*** Settings ***
Library           AppiumLibrary       10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1

*** Variables ***
${perfecto_hub_url}     https://demo.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}          <your_sec_token>
${deviceid_iphone}        <deviceName>
*** Test Cases ***
Demo test on iphone
    [Tags]    Perfecto  Device   iPhone
    [Teardown]   Close All Applications
    open application     ${perfecto_hub_url}     perfecto:securityToken=${perfecto_token}      perfecto:deviceName=${deviceid_iphone}     perfecto:automationName=appium
    ${params}=     Create Dictionary       generateHarFile=true
#    driver_execute_script        mobile:vnetwork:start          ${params}
    Go To Url    http://perfecto.io
    Sleep    5s
    Perform Ai Checkpoint    Do you see Perfecto logo on screen?
    ${ctx}=    get_contexts
    log to console     ${ctx}
    switch to context    ${ctx}[2]
    Sleep    3s
    Run Keyword And Ignore Error           click element     xpath=//*[@id="onetrust-accept-btn-handler"]
    Sleep    5s
    Click element     xpath=//*[@class="hero-email-submit"]
    Sleep    5s
    ${params}=     Create Dictionary
#    driver_execute_script     mobile:vnetwork:stop        ${params}
    PerfectoLibrary.swipe    50%     70%    50%   20%    3
    input text     xpath=//*[@id="FirstName"]    firstname
    input text     xpath=//*[@id="LastName"]    lastname
    ${a}=      get text      xpath=//*[@id="FirstName"]
    ${b}=      get text      xpath=//*[@id="LastName"]
    Element Should Contain Text      xpath=//*[@id="FirstName"]    ${a}
    Element Should Contain Text      xpath=//*[@id="LastName"]      ${b}



