*** Settings ***
Documentation       Market Index details Keywords
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
Resource    ../common/MarketIndex_variables.robot
Resource    ../common/graphql.robot


*** Keywords ***
Market Index
    ${gpql_json_data_count}     Get Length     ${gpql_json_data1}
    ${gpql_sedol_value}      Create List
    FOR   ${k}    IN RANGE   0     ${gpql_json_data_count}
    ${gpql_json_data3}=   Get from list   ${gpql_json_data1}  ${k}

    Append To List  ${gpql_sedol_value}
    END
    Log  ${gpql_sedol_value}


    ${gpql_json_data2}=   Get from list   ${gpql_json_data1}  0
    ${gpql_CurrentValue}=     Get Value From Json     ${gpql_json_data2}      $.data.marketindex[0].currentValue
    ${gpql_PreviousCloseValue}=  Get Value From Json     ${gpql_json_data2}      $.data.marketindex[0].previousCloseValue
    ${gpql_OpenValue}=             Get Value From Json     ${gpql_json_data2}      $.data.marketindex[0].openValue
    ${gpql_NetChange}=               Get Value From Json     ${gpql_json_data2}      $.data.marketindex[0].netChangeInValue
    ${gpql_PercentageChange}=          Get Value From Json     ${gpql_json_data2}      $.data.marketindex[0].percentageChange


    ${gpql_json_data0}=   Get from list   ${gpql_json_data1}  0

    ${gpql_CurrentValue_null_value}=     Get Value From Json     ${gpql_json_data0}      $.data.marketindex[0].currentValue
    ${gpql_PreviousCloseValue_null_value}=  Get Value From Json     ${gpql_json_data0}      $.data.marketindex[0].previousCloseValue
    ${gpql_OpenValue_null_value}=             Get Value From Json     ${gpql_json_data0}      $.data.marketindex[0].openValue
    ${gpql_NetChange_null_value}=               Get Value From Json     ${gpql_json_data0}      $.data.marketindex[0].netChangeInValue
    ${gpql_PercentageChange_null_value}=          Get Value From Json     ${gpql_json_data0}      $.data.marketindex[0].percentageChange





    ${webservice_curr_val_value}   Get from list       ${webservice_curr_val_value}  0
    ${webservice_pre_val_value}    Get from list       ${webservice_pre_val_value}   0
    ${webservice_open_val_value}  Get from list        ${webservice_open_val_value}  0
    ${webservice_Net_val_value}  Get from list         ${webservice_Net_val_value}   0
    ${webservice_per_cha_value}  Get from list         ${webservice_per_cha_value}   0



    ${webservice_curr_val_value1}   listToStringwithoutcotes       ${webservice_curr_val_value}
    ${webservice_pre_val_value1}    listToStringwithoutcotes       ${webservice_pre_val_value}
    ${webservice_open_val_value1}   listToStringwithoutcotes        ${webservice_open_val_value}
    ${webservice_Net_val_value1}    listToStringwithoutcotes         ${webservice_Net_val_value}
    ${webservice_per_cha_value1}   listToStringwithoutcotes         ${webservice_per_cha_value}



    ${gpql_CurrentValue1}           listToStringwithoutcotes           ${gpql_CurrentValue}
    ${gpql_PreviousCloseValue1}     listToStringwithoutcotes            ${gpql_PreviousCloseValue}
    ${gpql_OpenValue1}              listToStringwithoutcotes              ${gpql_OpenValue}
    ${gpql_NetChange1}              listToStringwithoutcotes              ${gpql_NetChange}
    ${gpql_PercentageChange1}       listToStringwithoutcotes              ${gpql_PercentageChange}



    ${gpql_CurrentValue2}           listToStringWithoutSquareBrackets              ${gpql_CurrentValue1}
    ${gpql_PreviousCloseValue2}     listToStringWithoutSquareBrackets              ${gpql_PreviousCloseValue1}
    ${gpql_OpenValue2}              listToStringWithoutSquareBrackets              ${gpql_OpenValue1}
    ${gpql_NetChange2}              listToStringWithoutSquareBrackets              ${gpql_NetChange1}
    ${gpql_PercentageChange2}       listToStringWithoutSquareBrackets              ${gpql_PercentageChange1}


    ${gpql_CurrentValue_null_value1}        listToStringwithoutcotes  ${gpql_CurrentValue_null_value}
    ${gpql_PreviousCloseValue_null_value1}  listToStringwithoutcotes  ${gpql_PreviousCloseValue_null_value}
    ${gpql_OpenValue_null_value1}           listToStringwithoutcotes  ${gpql_OpenValue_null_value}
    ${gpql_NetChange_null_value1}           listToStringwithoutcotes  ${gpql_NetChange_null_value}
    ${gpql_PercentageChange_null_value1}    listToStringwithoutcotes   ${gpql_PercentageChange_null_value}





    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_curr_val_value1}     ${gpql_CurrentValue2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_curr_val_value1}
    log     ${gpql_CurrentValue2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_pre_val_value1}      ${gpql_PreviousCloseValue2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
     log     ${webservice_pre_val_value1}
     log     ${gpql_PreviousCloseValue2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_open_val_value1}     ${gpql_OpenValue2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_open_val_value1}
    log     ${gpql_OpenValue2}


    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Net_val_value1}      ${gpql_NetChange2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Net_val_value1}
    log     ${gpql_NetChange2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_per_cha_value1}      ${gpql_PercentageChange2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_per_cha_value1}
    log     ${gpql_PercentageChange2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_CurrentValue_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_CurrentValue_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_PreviousCloseValue_null_value2}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_PreviousCloseValue_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_OpenValue_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log      ${gpql_OpenValue_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_NetChange_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_NetChange_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_PercentageChange_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_PercentageChange_null_value1}











