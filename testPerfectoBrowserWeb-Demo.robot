*** Settings ***
Library           SeleniumLibrary    10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1

*** Variables ***
${browser}     Chrome
${perfecto_hub_url}     https://<your_cloud_name>.perfectomobile.com/nexperience/perfectomobile/wd/hub
${perfecto_token}       <your_perfecto_security_token>

*** Test Cases ***
Open Perfecto site
    [Tags]    Perfeco  Browser   Chrome    Latest
    [teardown]      Close all browsers
    open test bb      ${browser}
    Open Getting Started page
    Fill the firstname and lastname fields



*** keywords ***
open test bb
    [Arguments]  ${b}
    ${capbilities}=     Create Dictionary        platformName=Windows      platformVersion=10      perfecto:location=US East     perfecto:resolution=1280x1024     perfecto:browserName=Chrome       perfecto:browserVersion=latest      perfecto:securityToken=${perfecto_token}
    run keyword if      '${b}'=='Chrome'        open browser    https://perfecto.io    chrome    perfecto-run    ${perfecto_hub_url}       ${capbilities}

Open Getting Started page
    Click element     xpath=//*[@id="perfecto-hp-banner"]/div/div/div/div/div[3]/div/div/div/span/a
    Select Window     NEW


Fill the firstname and lastname fields
    input text     xpath=//input[@id="FirstName"]    firstname
    Textfield Value Should Be      xpath=//input[@id="FirstName"]    firstname
    input text     xpath=//input[@id="LastName"]    lastname
    Textfield Value Should Be      xpath=//input[@id="LastName"]    lastname

