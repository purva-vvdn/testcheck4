*** Settings ***
Library     Selenium2Library
Library    XML
Library    Dialogs
Library    /home/vvdn13302/Desktop/VVDN_Icon/Test_data/setup.py
Resource    ../settings/Resources_file.robot


# *** Keywords ***

# Open My Browser
    
*** Keywords ***
Open My Browser
    setup_chrome_driver
    Go To    ${url}
    Maximize Browser Window
    Wait Until Page Contains Element    ${verify_login_page} 

    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # FOR    ${opt}    IN    @{CHROME_OPTIONS.split(',')}
    #     Call Method    ${options}    add_argument    --${opt}
    # END
    # Create WebDriver    Chrome    options=${options}
   #  ${Selection}=    Get Selection From User    Select the browser type      Chrome    Firefox 


   
   #   IF    '${Selection}'=='Chrome'
   #      Open Browser    ${url}  ${Selection}
   #      Open Browser    ${url}    Chrome    options=add_argument("--disable-extensions"), add_argument("--user-agent=CustomUserAgent")
   #      Maximize Browser Window
   #      Wait Until Page Contains Element    ${verify_login_page}       
   #   ELSE
            
   #      Open Browser    ${url}    ${Selection}
   #      Maximize Browser Window
   #      Wait Until Page Contains Element    ${verify_login_page}       
   #   END 
    

Closing the browser
    Close Browser