*** Settings ***
Documentation       Instrument Dividend Ratings Keywords
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
Resource    ../common/dividend_variables1.robot
Resource    ../common/graphql.robot


*** Keywords ***
sample instrument dividend details
    ${sql_query_list_count}     Get Length     ${sql_query_list}
   ${Source_Table_Script_Output}      Create List
    FOR   ${j}    IN RANGE   0     ${sql_query_list_count}
    ${x}=   Get from list  ${sql_query_list}     ${j}
   ${b}=              Query      ${x};
    Append To List  ${Source_Table_Script_Output}  ${b}
    END

    ${Source_Table_Script_Output1}  listToStringwithoutcotes    ${Source_Table_Script_Output}
    ${Source_Table_Script_Output2}     listToStringWithoutSquareBrackets    ${Source_Table_Script_Output1}
    ${Source_Table_Script_Output3}     listToStringWithoutRoundBrackets     ${Source_Table_Script_Output2}
    ##${Source_Table_Script_Output4}      Remove_Whitespace       ${Source_Table_Script_Output3}

    ${gpql_historic_yield1}     Create List
    ${gpql_json_data2_count}     Get Length     ${gpql_json_data2}
    FOR   ${k}    IN RANGE   0     ${gpql_json_data2_count}
    ${gpql_json_data3}=   Get from list   ${gpql_json_data2}  ${k}
    ${gpql_historic_yield}=     Get Value From Json     ${gpql_json_data3}      $.data.instrument.nodes[0].instrumentDividend.historicYieldNavtradedInstrument
    Append To List  ${gpql_historic_yield1}  ${gpql_historic_yield}
    END

    ${gpql_historic_yield2}  listToStringWithoutSquareBrackets   ${gpql_historic_yield1}


    ${gpql_json_data_count}     Get Length     ${gpql_json_data}
    ${gpql_dividend_yield1}  Create List
    ${gpql_total_dividend_paid_year_to_date1}  Create List
    ${gpql_ex_dividend_date1}  Create List
    ${gpql_dividend_pay_date1}  Create List
    FOR   ${i}    IN RANGE   0     ${gpql_json_data_count}
    ${gpql_json_data1}=   Get from list   ${gpql_json_data}  ${i}
    ${gpql_dividend_yield}=     Get Value From Json     ${gpql_json_data1}      $.data.instrument.nodes[0].instrumentDividend.yieldMarketTradedInstrument
    ${gpql_total_dividend_paid_year_to_date}=     Get Value From Json     ${gpql_json_data1}      $.data.instrument.nodes[0].instrumentDividend.dividendPaidYearToDate
    ${gpql_ex_dividend_date}=     Get Value From Json     ${gpql_json_data1}      $.data.instrument.nodes[0].instrumentDividend.exDividendDate
    ${gpql_dividend_pay_date}=     Get Value From Json     ${gpql_json_data1}      $.data.instrument.nodes[0].instrumentDividend.dividendPayDate

    Append To List  ${gpql_dividend_yield1}  ${gpql_dividend_yield}
    Append To List  ${gpql_total_dividend_paid_year_to_date1}  ${gpql_total_dividend_paid_year_to_date}
    Append To List  ${gpql_ex_dividend_date1}  ${gpql_ex_dividend_date}
    Append To List  ${gpql_dividend_pay_date1}  ${gpql_dividend_pay_date}
    END
    ${gpql_dividend_yield2}     listToStringWithoutSquareBrackets   ${gpql_dividend_yield1}
    ${gpql_total_dividend_paid_year_to_date2}    listToStringWithoutSquareBrackets    ${gpql_total_dividend_paid_year_to_date1}
    ${gpql_ex_dividend_date2}   listToStringWithoutSquareBrackets    ${gpql_ex_dividend_date1}
    ${gpql_dividend_pay_date2}   listToStringWithoutSquareBrackets    ${gpql_dividend_pay_date1}

    ${webservice_YIELD_value}   Get Variable Value      ${webservice_YIELD_value}
    ${webservice_DIVIDEND_value}    Get Variable Value      ${webservice_DIVIDEND_value}
    ${webservice_EXDIVDATE_value}  Get Variable Value      ${webservice_EXDIVDATE_value}
    ${webservice_DIVPAYDATE_value}  Get Variable Value      ${webservice_DIVPAYDATE_value}

    ${webservice_YIELD_value1}        listToStringwithoutcotes    ${webservice_YIELD_value}
    ${webservice_DIVIDEND_value1}        listToStringwithoutcotes    ${webservice_DIVIDEND_value}
    ${webservice_EXDIVDATE_value1}        listToStringwithoutcotes    ${webservice_EXDIVDATE_value}
    ${webservice_DIVPAYDATE_value1}        listToStringwithoutcotes    ${webservice_DIVPAYDATE_value}

    ${webservice_YIELD_value2}        listToStringWithoutSquareBrackets    ${webservice_YIELD_value1}
    ${webservice_DIVIDEND_value2}        listToStringWithoutSquareBrackets    ${webservice_DIVIDEND_value1}
    ${webservice_EXDIVDATE_value2}        listToStringWithoutSquareBrackets    ${webservice_EXDIVDATE_value1}
    ${webservice_DIVPAYDATE_value2}        listToStringWithoutSquareBrackets    ${webservice_DIVPAYDATE_value1}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${Source_Table_Script_Output3}    ${gpql_historic_yield2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log   ${Source_Table_Script_Output3}
    log   ${gpql_historic_yield2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_dividend_yield2}    ${webservice_YIELD_value2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log   ${gpql_dividend_yield2}
    log   ${webservice_YIELD_value2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_total_dividend_paid_year_to_date2}    ${webservice_DIVIDEND_value2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log   ${gpql_total_dividend_paid_year_to_date2}
    log   ${webservice_DIVIDEND_value2}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_ex_dividend_date2}    ${webservice_EXDIVDATE_value2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log   ${gpql_ex_dividend_date2}
    log   ${webservice_EXDIVDATE_value2}

    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${gpql_dividend_pay_date2}    ${webservice_DIVPAYDATE_value2}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log   ${gpql_dividend_pay_date2}
    log   ${webservice_DIVPAYDATE_value2}
