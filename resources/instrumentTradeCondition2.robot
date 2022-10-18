*** Settings ***
Documentation       Instrument Trade Condition2 Keywords
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
Resource    ../common/Instrument_Trade_Condition_variables.robot
Resource    ../common/graphql.robot


*** Keywords ***
instrument Trade Condition2

    ${gpql_json_data_count}     Get Length     ${gpql_json_data1}
    ${gpql_sedol_value}      Create List
    FOR   ${k}    IN RANGE   0     ${gpql_json_data_count}
    ${gpql_json_data3}=   Get from list   ${gpql_json_data1}  ${k}
    ${gpql_sedol_value1}=     Get Value From Json     ${gpql_json_data3}   $.data.instrument.nodes[0].instrumentTradeCondition.sedol
    Append To List  ${gpql_sedol_value}  ${gpql_sedol_value1}
    END
    Log  ${gpql_sedol_value}


    ${gpql_json_data2}=   Get from list          ${gpql_json_data1}   0
    ${gpql_TradePrice}=     Get Value From Json     ${gpql_json_data2}   $.data.instrument.nodes[0].instrumentTradeCondition.tradePrice
    ${gpql_TradeVolume}=     Get Value From Json     ${gpql_json_data2}    $.data.instrument.nodes[0].instrumentTradeCondition.tradeVolume
    ${gpql_Volume}=           Get Value From Json     ${gpql_json_data2}     $.data.instrument.nodes[0].instrumentTradeCondition.volume
    ${gpql_DayHigh}=            Get Value From Json     ${gpql_json_data2}     $.data.instrument.nodes[0].instrumentTradeCondition.dayHighPrice
    ${gpql_DayLow}=               Get Value From Json     ${gpql_json_data2}     $.data.instrument.nodes[0].instrumentTradeCondition.dayLowPrice
    ${gpql_Open}=                  Get Value From Json     ${gpql_json_data2}        $.data.instrument.nodes[0].instrumentTradeCondition.openPrice
    ${gpql_PreviousClose}=           Get Value From Json     ${gpql_json_data2}         $.data.instrument.nodes[0].instrumentTradeCondition.previousClosePrice



    ${gpql_json_data0}=                Get from list   ${gpql_json_data1}  0
    ${gpql_TradePrice_null_value}=      Get Value From Json     ${gpql_json_data0}   $.data.instrument.nodes[0].instrumentTradeCondition.tradePrice
    ${gpql_TradeVolume_null_value}=       Get Value From Json     ${gpql_json_data0}    $.data.instrument.nodes[0].instrumentTradeCondition.tradeVolume
    ${gpql_Volume_null_value}=              Get Value From Json     ${gpql_json_data0}     $.data.instrument.nodes[0].instrumentTradeCondition.volume
    ${gpql_DayHigh_null_value}=               Get Value From Json     ${gpql_json_data0}     $.data.instrument.nodes[0].instrumentTradeCondition.dayHighPrice
    ${gpql_DayLow_null_value}=                 Get Value From Json     ${gpql_json_data0}     $.data.instrument.nodes[0].instrumentTradeCondition.dayLowPrice
    ${gpql_Open_null_value}=                    Get Value From Json     ${gpql_json_data0}        $.data.instrument.nodes[0].instrumentTradeCondition.openPrice
    ${gpql_PreviousClose_null_value}=            Get Value From Json     ${gpql_json_data0}         $.data.instrument.nodes[0].instrumentTradeCondition.previousClosePrice





    ${webservice_Tra_pri_value}    Get from list       ${webservice_Tra_pri_value}    0
    ${webservice_Tra_vol_value}    Get from list       ${webservice_Tra_vol_value}    0
    ${webservice_vol_value}        Get from list       ${webservice_vol_value}        0
    ${webservice_Day_High_value}   Get from list       ${webservice_Day_High_value}   0
    ${webservice_Day_Low_value}    Get from list       ${webservice_Day_Low_value}    0
    ${webservice_Open_value}       Get from list       ${webservice_Open_value}       0
    ${webservice_Pre_clos_value}   Get from list       ${webservice_Pre_clos_value}   0
    ${webservice_sedol_value}  Get Variable Value      ${webservice_sedol_value}

    ${webservice_Tra_pri_value1}    listToStringwithoutcotes        ${webservice_Tra_pri_value}
    ${webservice_Tra_vol_value1}    listToStringwithoutcotes      ${webservice_Tra_vol_value}
    ${webservice_vol_value1}        listToStringwithoutcotes    ${webservice_vol_value}
    ${webservice_Day_High_value1}   listToStringwithoutcotes       ${webservice_Day_High_value}
    ${webservice_Day_Low_value1}    listToStringwithoutcotes       ${webservice_Day_Low_value}
    ${webservice_Open_value1}       listToStringwithoutcotes      ${webservice_Open_value}
    ${webservice_Pre_clos_value1}   listToStringwithoutcotes      ${webservice_Pre_clos_value}
    ${webservice_sedol_value1}      listToStringwithoutcotes      ${webservice_sedol_value}


    ${gpql_TradePrice1}             listToStringwithoutcotes       ${gpql_TradePrice}
    ${gpql_TradeVolume1}            listToStringwithoutcotes       ${gpql_TradeVolume}
    ${gpql_Volume1}                 listToStringwithoutcotes       ${gpql_Volume}
    ${gpql_DayHigh1}                listToStringwithoutcotes       ${gpql_DayHigh}
    ${gpql_DayLow1}                 listToStringwithoutcotes       ${gpql_DayLow}
    ${gpql_Open1}                   listToStringwithoutcotes       ${gpql_Open}
    ${gpql_PreviousClose1}          listToStringwithoutcotes       ${gpql_PreviousClose}
    ${gpql_sedol_value1}            listToStringwithoutcotes    ${gpql_sedol_value}

    ${gpql_TradePrice2}             listToStringWithoutSquareBrackets       ${gpql_TradePrice1}
    ${gpql_TradeVolume2}            listToStringWithoutSquareBrackets     ${gpql_TradeVolume1}
    ${gpql_Volume2}                 listToStringWithoutSquareBrackets      ${gpql_Volume1}
    ${gpql_DayHigh2}                listToStringWithoutSquareBrackets       ${gpql_DayHigh1}
    ${gpql_DayLow2}                 listToStringWithoutSquareBrackets      ${gpql_DayLow1}
    ${gpql_Open2}                   listToStringWithoutSquareBrackets       ${gpql_Open1}
    ${gpql_PreviousClose2}          listToStringWithoutSquareBrackets      ${gpql_PreviousClose1}

    ${gpql_TradePrice_null_value1}          listToStringwithoutcotes  ${gpql_TradePrice_null_value}
    ${gpql_TradeVolume_null_value1}         listToStringwithoutcotes  ${gpql_TradeVolume_null_value}
    ${gpql_Volume_null_value1}              listToStringwithoutcotes  ${gpql_Volume_null_value}
    ${gpql_DayHigh_null_value1}             listToStringwithoutcotes  ${gpql_DayHigh_null_value}
    ${gpql_DayLow_null_value1}              listToStringwithoutcotes  ${gpql_DayLow_null_value}
    ${gpql_Open_null_value1}                listToStringwithoutcotes  ${gpql_Open_null_value}
    ${gpql_PreviousClose_null_value1}       listToStringwithoutcotes  ${gpql_PreviousClose_null_value}




    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Tra_pri_value1}      ${gpql_TradePrice2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Tra_pri_value1}
    log     ${gpql_TradePrice2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Tra_vol_value1}      ${gpql_TradeVolume2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
     log     ${webservice_Tra_vol_value1}
     log     ${gpql_TradeVolume2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_vol_value1}     ${gpql_Volume2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_vol_value1}
    log     ${gpql_Volume2}


    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Day_High_value1}      ${gpql_DayHigh2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Day_High_value1}
    log     ${gpql_DayHigh2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Day_Low_value1}      ${gpql_DayLow2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Day_Low_value1}
    log     ${gpql_DayLow2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${webservice_Open_value1}     ${gpql_Open2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Open_value1}
    log     ${gpql_Open2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Pre_clos_value1}    ${gpql_PreviousClose2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Pre_clos_value1}
    log     ${gpql_PreviousClose2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${gpql_TradePrice_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_TradePrice_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_TradeVolume_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_TradeVolume_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_Volume_null_value1}    None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log      ${gpql_Volume_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_DayHigh_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_DayHigh_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_DayLow_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_DayLow_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_Open_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_Open_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_PreviousClose_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_PreviousClose_null_value1}












