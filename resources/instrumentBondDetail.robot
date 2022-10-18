*** Settings ***
Documentation       Instrument bond details Keywords
Library    SoapLibrary
Library    Collections
Library     XML
Library             OperatingSystem
Library             SeleniumLibrary
Library             pyodbc
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Library             OperatingSystem
Library             string
Library     DatabaseLibrary
Library     ../common/common.py
Resource    ../common/Instrument_bond_details_variables.robot
Resource    ../common/graphql.robot


*** Keywords ***
instrument bond details
    ${gpql_json_data_count}     Get Length     ${gpql_json_data1}
    ${gpql_sedol_value}      Create List
    FOR   ${k}    IN RANGE   0     ${gpql_json_data_count}
    ${gpql_json_data3}=   Get from list   ${gpql_json_data1}  ${k}
    ${gpql_sedol_value1}=     Get Value From Json     ${gpql_json_data3}      $.data.instrument.nodes[0].instrumentBondDetail.sedol
    Append To List  ${gpql_sedol_value}  ${gpql_sedol_value1}
    END
    Log  ${gpql_sedol_value}


    ${gpql_json_data2}=   Get from list   ${gpql_json_data}  0
    ${gpql_modifiedDuration}=     Get Value From Json     ${gpql_json_data2}      $.data.instrument.nodes[0].instrumentBondDetail.modifiedDuration
    ${gpql_couponFrequency}=     Get Value From Json     ${gpql_json_data2}      $.data.instrument.nodes[0].instrumentBondDetail.couponFrequency
    ${gpql_couponPercent}=     Get Value From Json     ${gpql_json_data2}      $.data.instrument.nodes[0].instrumentBondDetail.couponPercent

    ${gpql_json_data0}=   Get from list   ${gpql_json_data1}  0
    ${gpql_modifiedDuration_null_value}=     Get Value From Json     ${gpql_json_data0}      $.data.instrument.nodes[0].instrumentBondDetail.modifiedDuration
    ${gpql_couponFrequency_null_value}=     Get Value From Json     ${gpql_json_data0}      $.data.instrument.nodes[0].instrumentBondDetail.couponFrequency
    ${gpql_couponPercent_null_value}=     Get Value From Json     ${gpql_json_data0}      $.data.instrument.nodes[0].instrumentBondDetail.couponPercent

    ${webservice_mod_durtn_value}   Get from list      ${webservice_mod_durtn_value}    0
    ${webservice_pay_freq_value}    Get from list      ${webservice_pay_freq_value}     0
    ${webservice_coupn_rate_value}  Get from list       ${webservice_coupn_rate_value}  0
    ${webservice_sedol_value}  Get Variable Value      ${webservice_sedol_value}

    ${webservice_mod_durtn_value1}   listToStringwithoutcotes      ${webservice_mod_durtn_value}
    ${webservice_pay_freq_value1}    listToStringwithoutcotes     ${webservice_pay_freq_value}
    ${webservice_coupn_rate_value1}  listToStringwithoutcotes      ${webservice_coupn_rate_value}
    ${webservice_sedol_value1}  listToStringwithoutcotes      ${webservice_sedol_value}


    ${gpql_modifiedDuration1}   listToStringwithoutcotes    ${gpql_modifiedDuration}
    ${gpql_couponFrequency1}    listToStringwithoutcotes    ${gpql_couponFrequency}
    ${gpql_couponPercent1}   listToStringwithoutcotes    ${gpql_couponPercent}
    ${gpql_sedol_value1}   listToStringwithoutcotes    ${gpql_sedol_value}

    ${gpql_modifiedDuration2}   listToStringWithoutSquareBrackets    ${gpql_modifiedDuration1}
    ${gpql_couponFrequency2}    listToStringWithoutSquareBrackets    ${gpql_couponFrequency1}
    ${gpql_couponPercent2}   listToStringWithoutSquareBrackets    ${gpql_couponPercent1}


    ${gpql_modifiedDuration_null_value1}   listToStringwithoutcotes    ${gpql_modifiedDuration_null_value}
    ${gpql_couponFrequency_null_value1}    listToStringwithoutcotes    ${gpql_couponFrequency_null_value}
    ${gpql_couponPercent_null_value1}   listToStringwithoutcotes    ${gpql_couponPercent_null_value}

    ${gpql_modifiedDuration_null_value2}     listToStringWithoutSquareBrackets   ${gpql_modifiedDuration_null_value1}
    ${gpql_couponFrequency_null_value2}    listToStringWithoutSquareBrackets    ${gpql_couponFrequency_null_value1}
    ${gpql_couponPercent_null_value2}   listToStringWithoutSquareBrackets    ${gpql_modifiedDuration_null_value1}


    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_mod_durtn_value1}    ${gpql_modifiedDuration2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_mod_durtn_value1}
    log     ${gpql_modifiedDuration2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_pay_freq_value1}    ${gpql_couponFrequency2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
     log     ${webservice_pay_freq_value1}
    log     ${gpql_couponFrequency2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_coupn_rate_value1}    ${gpql_couponPercent2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_coupn_rate_value1}
    log     ${gpql_couponPercent2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_couponPercent_null_value2}    None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_couponPercent_null_value2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_modifiedDuration_null_value2}    None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_modifiedDuration_null_value2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_couponFrequency_null_value2}    None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_couponFrequency_null_value2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_couponPercent_null_value2}    None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_couponPercent_null_value2}











