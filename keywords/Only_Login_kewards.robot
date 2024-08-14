***SETTINGS***
Library     Selenium2Library
Library    XML
Resource   ../keywords/inital_setup.robot

*** Keywords ***

Login_to_dashboard
    Wait Until Element Is Visible    ${UserName_xpath}
    Input Text    ${UserName_xpath}    ${User_name}    
    Wait Until Element Is Visible    ${Passward_xpath}
    Input Password    ${Passward_xpath}    ${Password}
    Click Element    ${Login_button}
    Wait Until Page Contains Element    ${verify_login_page}