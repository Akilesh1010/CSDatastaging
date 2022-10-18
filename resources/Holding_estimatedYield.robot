*** Settings ***
Documentation       Holding Estimated Yield Keywords

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
Resource    ../test_data/Holding_estimatedYield.robot
Resource    ../mapping/Holding_estimatedYield_getClientPortfolio.robot



*** Keywords ***
Holding Estimated Yield from Figaro JETS Data Source Portfolio Services end point getClientPortfolio service
    Create Soap Client     ${Figaro_JETS_getClientPortfolio}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientPortfolio_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Holding_getClientPortfolio_attribute}     ${GQL_Holding_estimated_Yield_getClientPortfolio_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
     ${SOAP_Response1}  listToStringwithoutcotes  ${SOAP_Response}
      ${SOAP_Response2}  listToStringWithoutSquareBrackets   ${SOAP_Response1}
     ${SOAP_Response3}  dividetenlakh  ${SOAP_Response2}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Holding_getClientPortfolio}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response0}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountHoldings[0].${GPL_item}
     ${GPQL_Response1}  listToStringwithoutcotes  ${GPQL_Response0}
      ${GPQL_Response2}  listToStringWithoutSquareBrackets  ${GPQL_Response1}
      #${GPQL_Response}  roundoff  ${GPQL_Response2}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response3}
    Log     ${GPQL_Response2}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
     ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response3}  ${GPQL_Response2}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END

