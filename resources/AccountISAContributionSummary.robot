*** Settings ***
Documentation       Account ISA Contribution Summary Keywords

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
Resource    ../test_data/AccountISAContributionSummary.robot
Resource    ../mapping/AccountISAContributionSummary_getClientAccountDetails.robot



*** Keywords ***
Account ISA Contribution Summary from Figaro JETS Data Source Accounts Service Endpoint getClientAccountDetails service
    Create Soap Client     ${Figaro_JETS_getClientAccountDetails}     disable_warnings=1
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientAccountDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_AccountISAContributionSummary_getClientAccountDetails_attribute}     ${GQL_AccountISAContributionSummary_getClientAccountDetails_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}   Create List   ${text}
    ${SOAP_Response1}   listToStringwithoutcotes  ${SOAP_Response}
    ${SOAP_Response2}   convertLowercaseToUppercase  ${SOAP_Response1}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_AccountISAContributionSummary_getClientAccountDetails}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountISAContributionSummaries[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response2}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
         ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response2}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END

