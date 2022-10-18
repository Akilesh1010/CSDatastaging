*** Settings ***
Documentation       AccountExchangeRate Keywords

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
Resource    ../test_data/AccountExchangeRate.robot
Resource    ../mapping/AccountExchangeRate_getPortfolioPositions.robot



*** Keywords ***
AccountExchangeRate from Figaro JETS Data Source Portfolio Service Endpoint getPortfolioPositions service
    Create Soap Client     ${Figaro_JETS_getPortfolioPositions}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getPortfolioPositions_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_AccountExchangeRate_getPortfolioPositions_attribute}     ${GQL_AccountExchangeRate_getPortfolioPositions_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_AccountExchangeRate_getPortfolioPositions}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountExchangeRates[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
    Should Be Equal As Strings     ${SOAP_Response}   ${GPQL_Response}
    Delete All Sessions
    END

