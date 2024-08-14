*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Resource    ../settings/Resources_file.robot


*** Keywords ***
Verify_Device_profile_buttons
    Wait Until Element Is Visible        ${Device_profile}
    Click Element       ${Device_profile}
    Wait Until Page Contains Element    ${add_device_profile_button}
    Wait Until Page Contains Element    ${Refresh_device_profile_button} 
    Wait Until Page Contains Element    ${search_device_profile_button} 

Verify_Previously_cre_Dev_Profile
    Wait Until Page Contains Element    ${previously_cre_dev_profile}
    Wait Until Page Contains Element    ${export_device_profile_button} 
    Wait Until Page Contains Element    ${make_device_profile_default_button}
    Wait Until Page Contains Element    ${delete_device_profile_button}

Verify_default_profile_alrt_msg
    Wait Until Page Contains Element    ${Device_profile}
    Wait Until Element Is Visible    ${make_device_profile_default_button}
    Click Element    ${make_device_profile_default_button}
    Wait Until Page Contains Element    ${alert_msg_default_device_profile}
    Click Element    ${alert_msg_default_device_profile}
    Click Element    ${no_btn_on_alrt_msg}

Verify_delete_profile_alrt_msg
    Wait Until Page Contains Element    ${Device_profile}
    Click Element    ${delete_device_profile_button}
    Wait Until Page Contains Element    ${alert_msg_delete_device_profile}
    Click Element       ${alert_msg_delete_device_profile}
    Click Element       ${no_btn_on_delete_alrt_msg}

Verify_delete_device_profile
    Wait Until Page Contains Element    ${Device_profile}
    Click Element    ${add_device_profile_button}
    Wait Until Page Contains Element    ${create_new device_profile_btn}
    Wait Until Page Contains Element    ${import_device_profile_button}
    Click Element    ${create_new device_profile_btn}
    Wait Until Page Contains Element    ${add_device_profile_page}
    Sleep    3s
    Input Text      ${name_tab_add_device_profile_page}     ajit
    Click Element    ${add_btn_add_device_profile_page}
    Wait Until Page Contains Element    ${Device_profile_name}
    Click Element    ${Delete_newdevice _profile_button}
    Click Element    ${Yes_btn_on_delete_alrt_msg}


Verify_import_device_profile_elements
    Wait Until Page Contains Element    ${Device_profile}    10
    Click Element    ${add_device_profile_button}
    Wait Until Element Is Visible    ${import_device_profile_button}    50
    Click Element    ${import_device_profile_button}
    Wait Until Page Contains Element    ${import_device_profile_popup}
    Wait Until Page Contains Element    ${import_device_profile_cancel_btn}
    Wait Until Page Contains Element    ${import_device_profile_close_btn}
    Wait Until Page Contains Element    ${import_device_profile_remove_btn}
    Wait Until Page Contains Element    ${import_device_profile_import_btn}
    Click Element    ${import_device_profile_cancel_btn}
    Sleep    1

Verify_import_device_profile
    Wait Until Page Contains Element    ${Device_profile}
    Click Element    ${add_device_profile_button}
    Wait Until Page Contains Element    ${import_device_profile_button}
    Click Element    ${import_device_profile_button}
    #Click Element    ${Browse_file}
    Choose File     ${Browse_file}      /home/vvdn13302/Desktop/VVDN_Icon/TestCases/luv.json
    Wait Until Element Is Not Visible    ${uploaded_file}
    Click Element    ${import_device_profile_import_btn}
    
Verify_add_device_profile
    Wait Until Page Contains Element    ${Device_profile}
    Wait Until Element Is Visible    ${add_device_profile_button}
    Sleep    2s
    Click Element    ${add_device_profile_button}
    Wait Until Element Is Visible       ${create_new device_profile_btn}
    Click Element    ${create_new device_profile_btn}
    Wait Until Page Contains Element    ${add_device_profile_page}
    Sleep    3s
    Input Text      ${name_tab_add_device_profile_page}     VVDN
    Click Element    ${next_Transport_configuration}
    Click Element    ${next_Alaram_Rules_Tab}
    Click Element    ${next_Device_Provisioning}
    Click Element    ${Device_profile_details_tab}
    Input Text      ${Rule_chains_tab}    Root Rule Chain
    Wait Until Page Contains Element    ${root_rule_chain_tab}
    Click Element    ${root_rule_chain_tab}
    Input Text    ${queue}    SequentialByOriginator
   # Wait Until Page Contains Element    ${sequential_queue}
    #Click Element    ${sequential_queue}
    Input Text    ${Description}    testing
    Click Element    ${add_btn_add_device_profile_page}
 
Verify_Transport_Configuration
    Sleep    2s
    # Wait Until Page Contains Element    ${Device_profile}
    Click Element    ${add_device_profile_button}
    Wait Until Element Is Visible       ${create_new device_profile_btn}    20
    Click Element       ${create_new device_profile_btn}
    Wait Until Page Contains Element    ${add_device_profile_page}
    Sleep    3s
    Input Text      ${name_tab_add_device_profile_page}     VVDN1
    Click Element    ${next_Transport_configuration}
    Wait Until Page Contains Element    ${cancel_Transport_config_page}
    Wait Until Page Contains Element    ${add_Transport_config_page}
    Wait Until Page Contains Element    ${helpicon_Transport_config_page}
    Wait Until Page Contains Element    ${close_Transport_config_page}
    Wait Until Element Is Visible    ${Default_Transport_type}
    Wait Until Element Is Visible    ${Dropdown}    10
    Click Element       ${Dropdown}
    Mouse Over    ${MQTT_Transport_type}
    Click Element    ${MQTT_Transport_type}
    Wait Until Element Is Visible    ${MQTT_Transport_type1}
    Click Element    ${MQTT_Transport_type1}
    Mouse Over    ${Coap_Transport_type}
    Click Element    ${Coap_Transport_type}
    Wait Until Element Is Visible    ${Coap_Transport_type1}
    Click Element    ${Coap_Transport_type1}
    Mouse Over    ${LWM2M_Transport_type}
    Click Element    ${LWM2M_Transport_type}
    Wait Until Element Is Visible    ${LWM2M_Transport_type1}
    Click Element    ${LWM2M_Transport_type1}
    Mouse Over    ${SNMP_Transport_type}
    Click Element    ${SNMP_Transport_type}
    Click Element    ${next_Alaram_Rules_Tab}

Verify Alaram_Rules
    Wait Until Element Is Visible    ${Add_alaram_rule}
    Wait Until Page Contains Element    ${Back_Alaram_rule}
    Wait Until Page Contains Element    ${cancel_Alaram_rule}
    Wait Until Page Contains Element    ${add_btn_add_device_profile_page}
    Wait Until Page Contains Element    ${helpicon_Alaram_rule}
    Wait Until Page Contains Element    ${close_Alaram-rule}
    Wait Until Element Is Visible    ${Add_alaram_rule}
    Click Element    ${Add_alaram_rule}
    Wait Until Element Is Visible    ${alaram_type}
    Input Text    ${alaram_type}    temp
    Wait Until Element Is Visible    ${alaram_sevirity_critical}
    Click Element    ${alaram_sevirity_critical}
    Wait Until Element Is Visible    ${alaram_sevirity_major}
    Mouse Over    ${alaram_sevirity_major}
    Click Element    ${alaram_sevirity_major}
    Click Element    ${alaram_rule_condition}
    Wait Until Element Is Visible    ${edit_alaram_rule_condition} 
    Click Element    ${add_key_filter}
    Wait Until Element Is Visible    ${add_key_filter_popup}
    # Wait Until Element Is Visible    ${key_name}    20s
    # Sleep    1s
    # ${var}    Get WebElement    ${key_name}
    # Log    ${var}   
    # Execute Javascript  arguments[0]click();  ARGUMENTS  ${var}
    # Click Element    ${key_name}
    # Cover Element    //form[@class="ng-untouched ng-pristine ng-invalid" and @style="width: 700px;"]
    # Sleep    4
    # Cover Element    //*[@id="cdk-overlay-24" and @class="cdk-overlay-pane tb-dialog tb-fullscreen-dialog"]
    # Cover Element    (//*[@fxlayout="column" and @style="flex: 1 1 0%; box-sizing: border-box; flex-direction: column; display: flex;"])[4]    
    Sleep    15
    Execute Javascript    document.querySelector("#mat-input-17").click
    # Click Element    ${key_name}
    Input Text    ${key_name}    ac temp
    Click Element    ${value_name}
    Wait Until Element Is Visible    ${value_name_numeric}
    Mouse Over    ${value_name_numeric}
    Click Element    ${value_name_numeric}
    Wait Until Element Is Visible    ${add_filter}
    Click Element    ${add_filter}
    Wait Until Element Is Visible    ${value_filter}
    Input Text    ${value_filter}    30
    Click Element    ${add_filter_button}
    Wait Until Element Is Visible    ${save_edit_alaram_rule_condition}
    Click Element    ${save_edit_alaram_rule_condition}









