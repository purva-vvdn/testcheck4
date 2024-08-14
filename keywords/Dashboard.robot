*** Settings ***
Library    Selenium2Library
Resource    ../settings/Resources_file.robot


*** Keywords ***

Devices
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Device_management}
    Click Element    ${Devices}
    Wait Until Page Contains Element    ${Device_Page}
    Click Element    ${Side_nevigation_homeicon}

Device_Profile_Page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Device_management}
    Click Element    ${Device_profile}
    Wait Until Page Contains Element    ${Device_profile_page}
    Click Element    ${Side_nevigation_homeicon}

DashBoards_Page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Dashboard__management}
    Click Element    ${Dashboards}
    Wait Until Page Contains Element    ${Dashboards_page}
    Click Element    ${Side_nevigation_homeicon}

Widgets_Library_Page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Dashboard__management}
    Click Element    ${Widgets_Library}
    Wait Until Page Contains Element    ${Widgets_Library_Page}
    Click Element    ${Side_nevigation_homeicon}

Customer_Page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Customer_management}
    Click Element    ${Customers}
    Wait Until Page Contains Element    ${customers_Page}
    Click Element    ${Side_nevigation_homeicon}

Assets_Page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Asset_management}
    Click Element    ${Assets}
    Wait Until Page Contains Element    (//span[text()='Assets'])[2]
    Click Element    ${Side_nevigation_homeicon}

Rule_chains_page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Rules_management}
    Click Element    ${Rule_chains}
    Wait Until Page Contains Element    ${rule_chains_page}
    Click Element    ${Side_nevigation_homeicon}

Home_settings_page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${System_settings}
    Click Element    ${Home_setting}
    Wait Until Page Contains Element    ${home_setting_page}
    Click Element    ${Side_nevigation_homeicon}

Audit_Logs_Page

        Wait Until Page Contains Element    ${homepage}
        Wait Until Page Contains Element    ${Audit}
        Click Element    ${Audit_logs}
        ${current_url}      Get Location
        Should Be Equal    ${current_url}    ${audit_logpage_url}
        Click Element    ${Side_nevigation_homeicon}


 Entity_view_Page
    Wait Until Page Contains Element    ${homepage}
    Wait Until Page Contains Element    ${Entity_view_mangement}
    Click Element    ${Entity_views}
    ${current_url}      Get Location
    Should Be Equal    ${current_url}    ${Entity_viewpage_url}
    Click Element    ${Side_nevigation_homeicon}
    # Wait Until Page Contains Element    ${three dot menu}
    # Click Element    ${three dot menu}
    # Wait Until Page Contains Element    ${logout}
    # Click Element    ${logout}