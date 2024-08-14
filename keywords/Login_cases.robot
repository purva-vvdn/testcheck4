*** Settings ***
Library    Selenium2Library
Resource    ../settings/Resources_file.robot

*** Keywords ***

Login_cases_to_dashboard
    Wait Until Element Is Visible    ${UserName_xpath}
    Input Text    ${UserName_xpath}    ${User_name}
    Wait Until Element Is Visible    ${Passward_xpath}
    Input Password    ${Passward_xpath}    ${Password}
    Click Element    ${Login_button}
    Wait Until Page Contains Element    ${Verify_Login}    1000
    # Wait Until Page Contains Element    ${three dot menu}
    # Click Element    ${three dot menu}
    # Wait Until Page Contains Element    ${logout}
    # Click Element    ${logout}

Forgot_password
    Wait Until Page Contains Element    ${Forgot password}

Verify_Forgot_password_page
    Wait Until Page Contains Element    ${Forgot password}
    Click Element    ${Forgot password}
    Wait Until Page Contains Element    ${verify_forgot password_page}
    Wait Until Page Contains Element    ${reset_password_cancel}
    Click Element    ${reset_password_cancel}