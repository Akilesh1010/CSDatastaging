*** Settings ***
Documentation       Instrument Price refinitiv Keywords
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
Resource    ../common/News_variables.robot
Resource    ../common/graphql.robot


*** Keywords ***
Instrument Price entity refinitiv attributes validation

    ${gpql_json_data_count}     Get Length     ${gpql_json_data1}
    ${gpql_sedol_value}      Create List
    FOR   ${k}    IN RANGE   0     ${gpql_json_data_count}
    ${gpql_json_data3}=   Get from list   ${gpql_json_data1}  ${k}
    ${gpql_sedol_value1}=     Get Value From Json     ${gpql_json_data3}   $.data.instrument.nodes[0].instrumentPrice.sedol
    Append To List  ${gpql_sedol_value}  ${gpql_sedol_value1}
    END
    Log  ${gpql_sedol_value}


    ${gpql_json_data2}=   Get from list   ${gpql_json_data1}  0
    ${gpql_BidPrice}=       Get Value From Json     ${gpql_json_data2}    $.data.instrument.nodes[0].instrumentPrice.bidPrice
    ${gpql_midPrice}=           Get Value From Json     ${gpql_json_data2}     $.data.instrument.nodes[0].instrumentPrice.midPrice
    ${gpql_askingPrice}=            Get Value From Json     ${gpql_json_data2}     $.data.instrument.nodes[0].instrumentPrice.askingPrice
    ${gpql_priceChange}=               Get Value From Json     ${gpql_json_data2}     $.data.instrument.nodes[0].instrumentPrice.priceChange
    ${gpql_pricePercentageChange}=         Get Value From Json     ${gpql_json_data2}        $.data.instrument.nodes[0].instrumentPrice.priceChangePercent
    ${gpql_currency}=                          Get Value From Json     ${gpql_json_data2}         $.data.instrument.nodes[0].instrumentPrice.currency
    ${gpql_currentPriceEarningsRatio}=           Get Value From Json     ${gpql_json_data2}         $.data.instrument.nodes[0].instrumentPrice.currentPriceEarningsRatio


    ${gpql_json_data0}=                Get from list    ${gpql_json_data1}  0
    ${gpql_BidPrice_null_value}=          Get Value From Json     ${gpql_json_data0}   $.data.instrument.nodes[0].instrumentPrice.bidPrice
    ${gpql_midPrice_null_value}=            Get Value From Json     ${gpql_json_data0}    $.data.instrument.nodes[0].instrumentPrice.midPrice
    ${gpql_askingPrice_null_value}=            Get Value From Json     ${gpql_json_data0}      $.data.instrument.nodes[0].instrumentPrice.askingPrice
    ${gpql_priceChange_null_value}=               Get Value From Json     ${gpql_json_data0}       $.data.instrument.nodes[0].instrumentPrice.priceChange
    ${gpql_pricePercentageChange_null_value}=        Get Value From Json     ${gpql_json_data0}       $.data.instrument.nodes[0].instrumentPrice.priceChangePercent
    ${gpql_currency_null_value}=                       Get Value From Json     ${gpql_json_data0}        $.data.instrument.nodes[0].instrumentPrice.currency
    ${gpql_currentPriceEarningsRatio_null_value}=            Get Value From Json     ${gpql_json_data0}         $.data.instrument.nodes[0].instrumentPrice.currentPriceEarningsRatio

    ${webservice_Bid_Price_value}    Get from list        ${webservice_Bid_Price_value}     0
    ${webservice_mid_Price_value}        Get from list       ${webservice_mid_Price_value}    0
    ${webservice_asking_Price_value}        Get from list       ${webservice_asking_Price_value}        0
    ${webservice_price_Change_value}          Get from list          ${webservice_price_Change_value} 0
    ${webservice_price_PercentageChange_value}    Get from list       ${webservice_price_PercentageChange_value}    0
    ${webservice_currency_value}                    Get from list      ${webservice_currency_value}       0
    ${webservice_currentPrice_EarningsRatio_value}    Get from list       ${webservice_currentPrice_EarningsRatio_value}   0
    ${webservice_sedol_value}                           Get Variable Value      ${webservice_sedol_value}

    ${webservice_Bid_Price_value1}                  listToStringwithoutcotes        ${webservice_Bid_Price_value}
    ${webservice_mid_Price_value1}                   listToStringwithoutcotes      ${webservice_mid_Price_value}
    ${webservice_asking_Price_value1}                listToStringwithoutcotes    ${webservice_asking_Price_value}
    ${webservice_price_Change_value1}                listToStringwithoutcotes          ${webservice_price_Change_value}
    ${webservice_price_PercentageChange_value1}      listToStringwithoutcotes      ${webservice_price_PercentageChange_value}
    ${webservice_currency_value1}                    listToStringwithoutcotes  ${webservice_currency_value}
    ${webservice_currentPrice_EarningsRatio_value1}  listToStringwithoutcotes       ${webservice_currentPrice_EarningsRatio_value}
    ${webservice_sedol_value1}                       listToStringwithoutcotes      ${webservice_sedol_value}


    ${gpql_BidPrice1}                  listToStringwithoutcotes     ${gpql_BidPrice}
    ${gpql_midPrice1}                   listToStringwithoutcotes    ${gpql_midPrice}
    ${gpql_askingPrice1}                listToStringwithoutcotes    ${gpql_askingPrice}
    ${gpql_priceChange1}                listToStringwithoutcotes    ${gpql_priceChange}
    ${gpql_pricePercentageChange1}      listToStringwithoutcotes    ${gpql_pricePercentageChange}
    ${gpql_currency1}                   listToStringwithoutcotes    ${gpql_currency}
    ${gpql_currentPriceEarningsRatio1}  listToStringwithoutcotes    ${gpql_currentPriceEarningsRatio}
    ${gpql_sedol_value1}               listToStringwithoutcotes     ${gpql_sedol_value}

    ${gpql_BidPrice2}                   listToStringWithoutSquareBrackets    ${gpql_BidPrice1}
    ${gpql_midPrice2}                   listToStringWithoutSquareBrackets    ${gpql_midPrice1}
    ${gpql_askingPrice2}                listToStringWithoutSquareBrackets   ${gpql_askingPrice1}
    ${gpql_priceChange2}                listToStringWithoutSquareBrackets    ${gpql_priceChange1}
    ${gpql_pricePercentageChange2}      listToStringWithoutSquareBrackets  ${gpql_pricePercentageChange1}
    ${gpql_currency2}                   listToStringWithoutSquareBrackets   ${gpql_currency1}
    ${gpql_currentPriceEarningsRatio2}  listToStringWithoutSquareBrackets    ${gpql_currentPriceEarningsRatio1}
    ${gpql_sedol_value2}                listToStringWithoutSquareBrackets     ${gpql_sedol_value1}

    ${gpql_BidPrice_null_value1}          listToStringwithoutcotes  ${gpql_TradePrice_null_value}
    ${gpql_midPrice_null_value1}         listToStringwithoutcotes  ${gpql_TradeVolume_null_value}
    ${gpql_askingPrice_null_value1}              listToStringwithoutcotes  ${gpql_Volume_null_value}
    ${gpql_priceChange_null_value1}             listToStringwithoutcotes  ${gpql_DayHigh_null_value}
    ${gpql_pricePercentageChange_null_value1}              listToStringwithoutcotes  ${gpql_DayLow_null_value}
    ${gpql_currency_null_value1}                listToStringwithoutcotes  ${gpql_Open_null_value}
    ${gpql_currentPriceEarningsRatio_null_value1}       listToStringwithoutcotes  ${gpql_PreviousClose_null_value}





    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_Bid_Price_value1}      ${gpql_BidPrice2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_Bid_Price_value1}
    log     ${gpql_BidPrice2

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_mid_Price_value1}    ${gpql_midPrice2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
     log     ${webservice_mid_Price_value1}
     log     ${gpql_midPrice2

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${webservice_asking_Price_value1}  ${gpql_askingPrice2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_asking_Price_value1}
    log     ${gpql_askingPrice2}


    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings         ${webservice_price_Change_value1}  ${gpql_priceChange2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_price_Change_value1}
    log     ${gpql_priceChange2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_price_PercentageChange_value1}   ${gpql_pricePercentageChange2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_price_PercentageChange_value1}
    log     ${gpql_pricePercentageChange2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings          ${webservice_currency_value1}  ${gpql_currency2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_currency_value1}
    log     ${gpql_currency2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${webservice_currentPrice_EarningsRatio_value1} ${gpql_currentPriceEarningsRatio2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${webservice_currentPrice_EarningsRatio_value1}
    log     ${gpql_currentPriceEarningsRatio2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${gpql_BidPrice_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_BidPrice_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_midPrice_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_midPrice_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_askingPrice_null_value1}    None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log      ${gpql_askingPrice_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_priceChange_null_value1}  None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_priceChange_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_pricePercentageChange_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_pricePercentageChange_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_currency_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_currency_null_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings        ${gpql_currentPriceEarningsRatio_null_value1}   None
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${gpql_currentPriceEarningsRatio_null_value1}
















