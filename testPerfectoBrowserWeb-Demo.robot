*** Settings ***
Library           SeleniumLibrary    10
Library           PerfectoLibrary     RobotframeworkPerfectoBrowserDemoProject        v1.0         RobotframeworkPerfectoBrowserDemoJob       1
Library           OperatingSystem
*** Variables ***
${browser}     Chrome
${perfecto_hub_url}     https://<your_cloud_name>.perfectomobile.com/nexperience/perfectomobile/wd/hub/fast
${perfecto_token}       <your_perfecto_security_token>

*** Test Cases ***
Open Perfecto site
    [Tags]    Perfeco  Browser   Chrome    v83
    [teardown]      Close all browsers
    open test bb      ${browser}
    Open Getting Started page
    Fill the firstname and lastname fields



*** keywords ***
open test bb
    [Arguments]  ${b}
    Set Environment Variable             https_proxy              http://<user>:<pass>@proxyserver.com:8080
    ${capbilities}=     Create Dictionary        platformName=Windows      platformVersion=10      location=US East     resolution=1280x1024     browserName=Chrome       browserVersion=83      securityToken=${perfecto_token}
    run keyword if      '${b}'=='Chrome'        open browser    https://perfecto.io    chrome    perfecto-run    ${perfecto_hub_url}       ${capbilities}

Open Getting Started page
    Click element     xpath=//*[@id="perfecto-hp-banner"]/div/div/div/div/div[3]/div/div/div/span/a
    Select Window     NEW


Fill the firstname and lastname fields
    input text     xpath=//input[@id="FirstName"]    firstname
    Textfield Value Should Be      xpath=//input[@id="FirstName"]    firstname
    input text     xpath=//input[@id="LastName"]    lastname
    Textfield Value Should Be      xpath=//input[@id="LastName"]    lastname

