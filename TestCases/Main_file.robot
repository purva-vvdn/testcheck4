*** Settings ***
Library             Selenium2Library
Library             XML
Resource            ../settings/Resources_file.robot
Suite Setup         Open My Browser
Suite Teardown      Closing the browser
# Test Setup    Login_to_dashboard

*** Test Case ***

Tc_1 Forgot password test
    Set Selenium Speed    1
    Forgot_password
Tc_2 Forgot passowrd page test
    Set Selenium Speed    1
    Verify_Forgot_password_page
Tc_3 Login
    Set Selenium Speed    1
    Login_cases_to_dashboard

Tc_4 HomepageDashbaord_Validation
    Set Selenium Speed    1
    Devices
    Device_Profile_Page
    DashBoards_Page
    Widgets_Library_Page
    Customer_Page
    Assets_Page
    Rule_chains_page
    Home_settings_page
    Audit_Logs_Page
    Entity_view_Page

Tc_5 Verify all icons in side nevigation panel
    Set Selenium Speed    1
    Side_nevigational_panel_table

# Tc_6 All_TC_of_Devices module_and_add
#     Set Selenium Speed    0.5
#     Devices_Dashboard_Page_module
#     # Device checkbox and its verification
#     Add_Device_in_Device_module_setup
#     Add_new_device_module_tc
#     Add_new_device_transport_config_module_tc

Tc_7 Verify Device profile
    Set Selenium Speed    1
    Verify_Device_profile_buttons
    Verify_Previously_cre_Dev_Profile
    Verify_default_profile_alrt_msg
    Verify_delete_profile_alrt_msg
    Verify_delete_device_profile
    Verify_import_device_profile_elements
    Verify_import_device_profile
    Verify_add_device_profile
    Verify_Transport_Configuration
    Verify Alaram_Rules    

Tc_ Logout_feature testing and verification
    Logout_option

