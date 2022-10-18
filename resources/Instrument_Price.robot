*** Settings ***
Documentation       Instrument Price Keywords

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
Resource    ../test_data/Instrument_Price.robot
Resource    ../mapping/InstrumentPrice_fetchInstrument.robot



*** Keywords ***
Instrument Price from Figaro JETS Data Source Instrument Service Endpoint fetchInstrument service
    Create Soap Client     ${Figaro_JETS_fetchInstrument}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_fetchInstrument_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_InstrumentPrice_fetchInstrument_attribute}     ${GQL_InstrumentPrice_fetchInstrument_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_InstrumentPrice_fetchInstrument}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.instrument.nodes[0].instrumentPrice.${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END

###FUND SEDOL
Instrument Price attributes divided from Figaro JETS Data Source Instrument Service Endpoint fetchInstrument service
    Create Soap Client     ${Figaro_JETS_fetchInstrument}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_fetchInstrument_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_InstrumentPriceAttributesDivided_fetchInstrument_attribute}     ${GQL_InstrumentPriceAttributesDivided_fetchInstrument_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response0}  Create List    ${text}
    ${SOAP_Response1}  listToStringwithoutcotes  ${SOAP_Response0}
    ${SOAP_Response2}  listToStringWithoutSquareBrackets   ${SOAP_Response1}
    ${SOAP_Response}   dividetenthousand   ${SOAP_Response2}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_InstrumentPrice_fetchInstrument}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.instrument.nodes[0].instrumentPrice.${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END

