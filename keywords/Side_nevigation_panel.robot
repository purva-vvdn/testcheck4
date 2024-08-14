*** Settings ***
Library     Selenium2Library
Library    XML
Library    Collections
Library    String
Resource    ../keywords/inital_setup.robot
Resource    ../settings/Resources_file.robot
*** Keywords ***

Side_nevigational_panel_table
    Sleep    10
    Wait Until Element Is Visible    ${side_panal_table_xpath}    1000
    ${name}    Get WebElements   ${side_panal_table_xpath}
    ${result}    Get Text    ${name}
    @{elements}=    Split String    ${result}    ${\n}
    Set Global Variable    @{elements}    
    FOR    ${element}    IN    @{elements}
        Wait Until Element Is Visible    (//span[text()="${element}"])[1]    10000
        Click Element    (//span[text()="${element}"])[1]
        TRY
            Wait Until Element Is Visible    //h1[text()=" ${element} "]
            Page Should Contain Element    //h1[text()=" ${element} "]
            
        EXCEPT 
            TRY
                Wait Until Element Is Visible    //a[text()=" ${element} "]
                Page Should Contain Element    //a[text()=" ${element} "]
                
            EXCEPT
                
                Skip
                
                
            END
            
            
            
        END
        
        
    END    
     
    