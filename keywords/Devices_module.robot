*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
# Library    AppiumLibrary
Resource    ../settings/Resources_file.robot


*** Keywords ***

Devices_Dashboard_Page_module
    # Get Element Count    locator
    Wait Until Element Is Visible    ${Devices_xpath_SNP}    10
    Click Element    ${Devices_xpath_SNP}
    Page Should Contain Element    ${verify_Devices_xpath_SNP}    #verifying Devices homepage
    Wait Until Element Is Visible    ${Devices_Filter_box}    10
    # Location Should Contain    ${Devices_Filter_box}    All
    ${text}=    Get Value    ${Devices_Filter_box}
    IF    '${text}' == 'All'
        Log    default value is All
    ELSE
        Log    Defaut value is ${text}
        Fatal Error

    END
    Clear Element Text    ${Devices_Filter_box}
    Element Attribute Value Should Be    ${Devices_Filter_box}    placeholder    Device profile
    Log    verified helpText Device profile 
    Wait Until Element Is Visible    ${DEvices_filter_suggestion}
    Click Element    ${DEvices_filter_suggestion}
    Wait Until Element Is Visible    ${table_Data}
    ${table_count}    Selenium2Library.Get Element Count    ${table_Data}
    FOR    ${counter}    IN RANGE    1    ${table_count}+1    1
        ${text_table_value}    Get Text    (${table_Data})[${counter}]
        IF    '${text_table_value}' == 'default'
                Log    verified filter based on table entity
        ELSE
                Log    Fail to verify value in table based on filter
                Run Keyword If Test Failed    Logout_option
                # Fatal Error  
        END
            
    END
    Click Element    ${xpath_x_button}
    ${text_1}=    Get Value    ${Devices_Filter_box}
    IF    '${text_1}' == ''
        Log    verified Data is cleared
    ELSE
        Log    Fail to verified Data is cleared
        Fatal Error

    END
    Click Element    //tb-breadcrumb[@class="mat-toolbar-tools"]

Device checkbox and its verification
    TRY
        ${unchecked}    Element Attribute Value Should Be    (${verify_checked_or_not})[1]    aria-checked    false
        Log    "Select all" checkbox is not selected
        Log    verifying all data checked or not in table
        ${checkbox_xpath_count}    Selenium2Library.Get Element Count    ${verify_checked_or_not}
        FOR    ${data}    IN RANGE    2    ${checkbox_xpath_count}+1    1
            Element Attribute Value Should Be    (${verify_checked_or_not})[${data}]    aria-checked    false
        END


        Wait Until Element Is Visible    //mat-checkbox[@id="mat-checkbox-8"]
        Click Element    //mat-checkbox[@id="mat-checkbox-8"]
        # Sleep    100
        ${checked}    Element Attribute Value Should Be    (${verify_checked_or_not})[1]    aria-checked    true       
        Log    "Select all" checkbox is selected
        Log    verifying all data checked or not in table
        ${checkbox_xpath_count}    Selenium2Library.Get Element Count    ${verify_checked_or_not}
        FOR    ${data}    IN RANGE    2    ${checkbox_xpath_count}+1    1
            Element Attribute Value Should Be    (${verify_checked_or_not})[${data}]    aria-checked    true
        END
        
        Click Element    //mat-checkbox[@id="mat-checkbox-8"]
        Click Element    //mat-checkbox[@id="mat-checkbox-9"]
        Click Element    //mat-checkbox[@id="mat-checkbox-10"]
        ${mixed}    Element Attribute Value Should Be    (${verify_checked_or_not})[1]    aria-checked    mixed            
        Log    "Select all" checkbox is unselected but some customers are selected
        Log    verifying all data to find mixed checked customer in table
        ${checkbox_xpath_count}    Selenium2Library.Get Element Count    ${verify_checked_or_not}
        FOR    ${data}    IN RANGE    2    ${checkbox_xpath_count}+1    1
            ${check_or_not}    Selenium2Library.Get Element Attribute    (${verify_checked_or_not})[${data}]    aria-checked
            IF   '${check_or_not}'== 'mixed' 
                Log    Verified mix check for each customer in table
            ELSE
                Log    customer table is not checked or customer dont exist please add 2 or more customer
            END
        END
    EXCEPT
        Run Keyword If Test Failed    Verify_Device_profile_buttons

    END
    
Add_Device_in_Device_module_setup  
    Wait Until Element Is Visible    ${add_device_profile_button}    20
    Click Element    ${add_device_profile_button}
    Wait Until Element Is Visible    ${create_new device_profile_btn}    60
    Click Element    ${create_new device_profile_btn}
    Element Should Contain    //*[text()="Add new device"]    Add new device    verified

    
Add_new_device_module_tc
    Wait Until Element Is Visible    ${Add_NEW_devie_name_field}    30
    Click Element    ${Add_NEW_devie_name_field}
    Input Text    ${Add_NEW_devie_name_field}    ${Test_data_name}
    Wait Until Element Is Visible    ${Add_NEW_devie_label_field}    10 
    Input Text    ${Add_NEW_devie_label_field}     ${Test_data_label}
    Element Should Be Visible    ${Existing_device_profile_Radio_button}
    Click Element    ${xpath_x_button_4}
    # Sleep    2
    Wait Until Element Is Visible    ${variable_xPath}
    ${data}=    Selenium2Library.Get Element Count    ${variable_xPath}
    Log    ${data}
    FOR    ${counter}    IN RANGE    1    ${data}    1
        Log    ${counter}
        Wait Until Element Is Visible    (${variable_xPath})[${counter}]
        Click Element    (${variable_xPath})[${counter}]
        Wait Until Element Is Visible    ${xpath_x_button_4}
        Click Element    ${xpath_x_button_4}
        
    END

    Click Element    ${creating_device_profile_Radio_button}
    Click Element    ${device_prof_name}
    Wait Until Element Is Visible    ${select_device_prof_name}
    Click Element    ${select_device_prof_name}


    Wait Until Element Is Visible    ${select_device profile_checkbox}
    Click Element    ${select_device profile_checkbox}
    Input Text    ${device_prof_inputbox}    ${Test_device_name}


    Wait Until Element Is Visible    ${Rule_chain_input_field}
    Click Element    ${Rule_chain_input_field}
    Wait Until Element Is Visible    ${rule_chain_option}
    ${data1}=    Selenium2Library.Get Element Count    ${rule_chain_option}
    Log    ${data1}
    FOR    ${counter1}    IN RANGE    1    ${data1}    1
        Log    ${counter1}
        Wait Until Element Is Visible    (${rule_chain_option})[${counter1}]
        Click Element    (${rule_chain_option})[${counter1}]
        Wait Until Element Is Visible    ${xpath_x_button_4}
        Click Element    ${xpath_x_button_4}
        
    END


    Wait Until Element Is Visible    ${queue_input_box}
    Click Element    ${queue_input_box}
    ${data2}=    Selenium2Library.Get Element Count    ${Queue_table_option}
    Log    ${data2}
    FOR    ${counter2}    IN RANGE    1    ${data2}    1
        Log    ${counter2}
        Wait Until Element Is Visible    (${Queue_table_option})[${counter2}]
        Click Element    (${Queue_table_option})[${counter2}]
        Wait Until Element Is Visible    ${xpath_x_button_4}
        Click Element    ${xpath_x_button_4}
        
    END



    Wait Until Element Is Visible    ${is_gateway_checkbox}
    Click Element    ${is_gateway_checkbox}
    Element Should Be Visible    ${overwrite_gateway_time_activity}
    Click Element    ${overwrite_gateway_time_activity}
    Wait Until Element Is Visible    ${overwrite_gateway_time_activity}
    Click Element    ${overwrite_gateway_time_activity}
    Wait Until Element Is Visible    ${is_gateway_checkbox}
    Click Element    ${is_gateway_checkbox}
    Element Should Not Be Visible    ${overwrite_gateway_time_activity}

    Input Text    ${Description_xpath}    ${text_for_description}

    Click Element    ${Next_button_transport_config}



Add_new_device_transport_config_module_tc
    #select default from dropdown
    Wait Until Element Is Visible    ${default_dropdown}
    Click Element    ${default_dropdown}
    Wait Until Element Is Visible    ${default_option}    30
    Click Element    ${default_option}
    #select mqtt from dropdown
    Wait Until Element Is Visible    ${default_dropdown}    30
    Click Element    ${default_dropdown}
    Wait Until Element Is Visible    ${mqtt_transport}    30
    Click Element    ${mqtt_transport}
    Wait Until Element Is Visible    ${mqtt_transport_subOption}    30
    Click Element    ${mqtt_transport_subOption}
    Wait Until Element Is Visible    ${mqtt_transport_subOption}
    Clear Element Text    ${mqtt_transport_subOption}    
    Input Text    ${mqtt_transport_subOption}    v1/devices/me/telemetry
    Clear Element Text    ${mqtt_telemetry_subOption}
    Input Text    ${mqtt_telemetry_subOption}    v1/devices/me/attributes
    Wait Until Element Is Visible    ${mqtt_device_payload}
    Click Element    ${mqtt_device_payload}
    Wait Until Element Is Visible    ${mqtt_device_2_payload}
    Click Element    ${mqtt_device_2_payload}
    Wait Until Element Is Visible    //*[@style="transform: translate(0px, 0px); width: 894.398px; height: 199px;"]
    Scroll Element Into View    //*[@style="transform: translate(0px, 0px); width: 894.398px; height: 199px;"]
    ${text}=    Get Text    //*[text()="Telemetry proto schema"]        
        Log    heading ${text}
    Wait Until Element Is Visible    //*[@style="transform: translate(0px, 0px); width: 894.398px; height: 199px;"]
    Click Element    //*[@style="transform: translate(0px, 0px); width: 894.398px; height: 199px;"]
    Wait Until Element Is Visible    (//*[text()="fullscreen"])[2]
    Click Element    (//*[text()="fullscreen"])[2]
    Press Keys    None    CTRL+ x
    Press Keys    None    BACKSPACE
    Press Keys    None    CTRL+ v
    Wait Until Element Is Visible    (//*[text()="fullscreen_exit"])
    Click Element    (//*[text()="fullscreen_exit"])
    Click Element    //*[text()=" Tidy "]
    Click Element    //*[text()=" Enable compatibility with other payload formats. "]
    Wait Until Element Is Visible    //*[text()=" Use Json format for default downlink topics "]
    Click Element    //*[text()=" Use Json format for default downlink topics "]
    Wait Until Element Is Visible    //*[text()=" Send PUBACK on PUBLISH message validation failure "]
    Click Element    //*[text()=" Send PUBACK on PUBLISH message validation failure "]


    #select coap from dropdown
    Wait Until Element Is Visible    ${mqtt_dropdown_selected}
    Click Element    ${mqtt_dropdown_selected}
    Wait Until Element Is Visible    ${coap_select_from_dropdown}
    Click Element    ${coap_select_from_dropdown}
    Wait Until Element Is Visible    ${coap_device_type}
    Click Element    ${coap_device_type}
    Wait Until Element Is Visible    ${coap_device_type_2nd_option}
    Click Element    ${coap_device_type_2nd_option}
    Scroll Element Into View    //*[text()="Discontinuous Reception (DRX)"]    
    Click Element    //*[text()="Discontinuous Reception (DRX)"]
    Wait Until Element Is Visible    ${power_saving_mode}    15
    # Sleep    3
    Click Element    ${power_saving_mode}
    Wait Until Element Is Visible    //*[@type="number" and @min="0"]    20
    Clear Element Text    //*[@type="number" and @min="0"]
    Input Text    //*[@type="number" and @min="0"]    20
    TRY
        Click Element    //*[text()="Seconds"]
        Click Element    //*[text()=" Minutes "]
    EXCEPT
        Log    Default is not 'Second'
        Click Element    //*[@role="combobox" and @formcontrolname="unit"]
        Click Element    //*[text()=" Minutes "]
    END
    
    #select lwm2m from dropdown

    Wait Until Element Is Visible    ${coap_select_from_dropdown_1}
    Click Element    ${coap_select_from_dropdown_1}
    Click Element   //*[text()=" LWM2M "]
    # Wait Until Element Is Visible    //*[@aria-label="Clear" and @type="button"]    15
    # Click Element    //*[@aria-label="Clear" and @type="button"]
    Wait Until Element Is Visible    //*[text()="Bootstrap"]
    Click Element    //*[text()="Bootstrap"]
    Click Element    //*[text()=" Include Bootstrap Server updates "]
    Click Element    //*[text()="Other settings"]
    Click Element    //*[@role="combobox" and @aria-haspopup="true" and @formcontrolname="fwUpdateStrategy"]
    Wait Until Element Is Visible    (//*[text()='Push firmware update as binary file using Object 19 and Resource 0 (Data)'])[1]
    Click Element    (//*[text()='Push firmware update as binary file using Object 19 and Resource 0 (Data)'])[1]
    Click Element    (//*[@aria-haspopup="true" and @aria-expanded="false" and @tabindex="0"])[5]
    Wait Until Element Is Visible    (//*[text()=" Power Saving Mode (PSM) "])    20
    Scroll Element Into View    (//*[text()=" Power Saving Mode (PSM) "])
    Click Element    (//*[text()=" Power Saving Mode (PSM) "])
    Wait Until Element Is Visible    //*[@type="number"]    15
    Clear Element Text    //*[@type="number"]
    Input Text    //*[@type="number"]    10
    TRY
        Click Element    //*[text()="Seconds"]
        Click Element    //*[text()=" Minutes "]
    EXCEPT
        Log    Default is not 'Second'
        Click Element    //*[@role="combobox" and @formcontrolname="unit"]
        Click Element    //*[text()=" Minutes "]
    END
    Click Element    //*[text()="Supports composite Read/Write/Observe operations"]
    Click Element    //*[text()="Json Config Profile Device"]
    Click Element    (//*[text()="fullscreen"])[2]
    Click Element    (//*[text()="fullscreen_exit"])
    


    #select SNMP from dropdown    

    Wait Until Element Is Visible    //*[text()="LWM2M"]
    Click Element    //*[text()="LWM2M"]
    Wait Until Element Is Visible    (//*[text()=" SNMP "])
    Click Element    (//*[text()=" SNMP "])
    Clear Element Text    (//*[@type="number" and @min="0" and @formcontrolname="timeoutMs"])
    Input Text    (//*[@type="number" and @min="0" and @formcontrolname="timeoutMs"])    600
    Clear Element Text    (//*[@type="number" and @min="0" and @formcontrolname="retries"])
    Input Text    (//*[@type="number" and @min="0" and @formcontrolname="retries"])    2
    Scroll Element Into View    (//*[@type="number" and @min="0" and @formcontrolname="queryingFrequencyMs"])
    Clear Element Text    (//*[@type="number" and @min="0" and @formcontrolname="queryingFrequencyMs"])
    Input Text    (//*[@type="number" and @min="0" and @formcontrolname="queryingFrequencyMs"])    5001
    Click Element    (//*[text()="String"])
    Click Element    (//*[text()=" Integer "])
    Input Text    (//*[@formcontrolname="key" ])    2
    Input Text    (//*[@formcontrolname="oid" ])    Alfa
    Click Element    (//*[text()="close" and @role="img"])[4]
    Clear Element    (//*[@type="button"])/following :: span[text()="Close"]
