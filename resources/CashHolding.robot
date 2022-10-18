*** Settings ***
Documentation       Cash Holding Keywords
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
Resource    ../test_data/CashHolding.robot
Resource    ../mapping/CashHolding_getAvailableCredit.robot
Resource    ../mapping/CashHolding_getClientDetails.robot
#Resource    ../mapping/CashHolding_getPortfolioPositions.robot


*** Keywords ***
Cash Holding from Figaro JETS Data Source Accounts Service End Point getAvailableCredit service
    Create Soap Client     ${Figaro_JETS_getAvailableCredit}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getAvailableCredit_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_CashHolding_getAvailableCredit_attribute}     ${GQL_CashHolding_getAvailableCredit_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
     ${SOAP_Response1}  listToStringwithoutcotes  ${SOAP_Response}
      ${SOAP_Response2}  listToStringWithoutSquareBrackets   ${SOAP_Response1}
     ${SOAP_Response3}  dividetenlakh  ${SOAP_Response2}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_CashHolding_getAvailableCredit}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountCashHolding.${GPL_item}
    ${GPQL_Response1}  listToStringWithoutSquareBrackets  ${GPQL_Response}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response3}
    Log     ${GPQL_Response1}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
     ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response3}  ${GPQL_Response1}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    END

Cash Holding from Figaro JETS Data Source Person Service End Point getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_CashHolding_getClientDetails_attribute}     ${GQL_CashHolding_getClientDetails_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${SOAP_Response1}  listToStringwithoutcotes  ${SOAP_Response}
      ${SOAP_Response2}  listToStringWithoutSquareBrackets   ${SOAP_Response1}
     ${SOAP_Response3}  dividetenlakh  ${SOAP_Response2}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_CashHolding_getClientDetails}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountCashHolding.${GPL_item}
    ${GPQL_Response1}  listToStringWithoutSquareBrackets  ${GPQL_Response}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response3}
    Log     ${GPQL_Response1}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
    ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response3}  ${GPQL_Response1}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END
