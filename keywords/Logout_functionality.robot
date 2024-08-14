*** Settings ***
Library    Selenium2Library
Resource    ../settings/Resources_file.robot

*** Keywords ***
Logout_option
    Wait Until Page Contains Element    ${three dot menu}
    Click Element    ${three dot menu}
    Wait Until Page Contains Element    ${logout}
    Click Element    ${logout}
    Wait Until Page Contains    Login