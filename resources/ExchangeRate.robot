*** Settings ***
Documentation       ExchangeRate Keywords

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
Resource    ../test_data/ExchangeRate.robot
Resource    ../mapping/ExchangeRate_exchangeRateService.robot



*** Keywords ***
ExchangeRate from Figaro JETS Data Source Exchange Rate End Point getExchangeRateTable service
    Create Soap Client     ${Figaro_JETS_exchangeRateService}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_exchangeRateService_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_ExchangeRate_exchangeRateService_attribute}     ${GQL_ExchangeRate_exchangeRateService_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response2}  Create List    ${text}
    ${SOAP_Response1}    listToStringwithoutAsterisk      ${SOAP_Response2}
    ${SOAP_Response}    listToStringwithoutcotes      ${SOAP_Response1}

    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_ExchangeRate_exchangeRateService}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response1}=      Get Value From Json     ${value}     $.data.exchangeRate.${GPL_item}
    ${GPQL_Response}        listToStringwithoutcotes                  ${GPQL_Response1}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
     ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
     RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL


    Delete All Sessions
    END

ExchangeRate-fromcurrencycode from Figaro JETS Data Source Exchange Rate End Point getExchangeRateTable service
    Create Soap Client     ${Figaro_JETS_exchangeRateService}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_exchangeRateService_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_ExchangeRate_exchangeRateService_fromcurrencycode_attribute}     ${GQL_ExchangeRate_exchangeRateService_fromcurrencycode_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response1}  Create List    ${text}
    ${SOAP_Response2}    listToStringwithoutcotes      ${SOAP_Response1}
    ${SOAP_Response3}    getSubstringexchangeRateFromcurrency      ${SOAP_Response2}
    ${SOAP_Response}     listToStringWithoutSquareBrackets      ${SOAP_Response3}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_ExchangeRate_exchangeRateService}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response1}=      Get Value From Json     ${value}     $.data.exchangeRate.${GPL_item}
    ${GPQL_Response2}        listToStringwithoutcotes                  ${GPQL_Response1}
    ${GPQL_Response}        listToStringWithoutSquareBrackets                  ${GPQL_Response2}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
     ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
     RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL


    Delete All Sessions
    END


ExchangeRate-tocurrencycode from Figaro JETS Data Source Exchange Rate End Point getExchangeRateTable service
    Create Soap Client     ${Figaro_JETS_exchangeRateService}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_exchangeRateService_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_ExchangeRate_exchangeRateService_tocurrencycode_attribute}     ${GQL_ExchangeRate_exchangeRateService_tocurrencycode_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response1}  Create List    ${text}
    ${SOAP_Response2}    listToStringwithoutcotes      ${SOAP_Response1}
    ${SOAP_Response3}  getSubstringexchangeRateTocurrency  ${SOAP_Response2}
    ${SOAP_Response}     listToStringWithoutSquareBrackets      ${SOAP_Response3}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_ExchangeRate_exchangeRateService}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response1}=      Get Value From Json     ${value}     $.data.exchangeRate.${GPL_item}
    ${GPQL_Response2}        listToStringwithoutcotes                  ${GPQL_Response1}
    ${GPQL_Response}        listToStringWithoutSquareBrackets                  ${GPQL_Response2}

    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
     ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
     RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL


    Delete All Sessions
    END

