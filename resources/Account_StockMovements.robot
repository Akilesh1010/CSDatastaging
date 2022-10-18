*** Settings ***
Documentation       Account Stock Movements Keywords

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
Resource    ../test_data/Account.robot
Library    ../common/readexcel.py
Resource    ../mapping/Account_getClientDetails.robot
Resource   ../common/Read_excel.robot




*** Keywords ***
Account Stock Movements from Figaro JETS Data Source Person Service Endpoint getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Account_getClientDetails_attribute}     ${GQL_Account_getClientDetails_attribute}
    Continue For Loop If  "${xml_item}" =='portfolioReference'
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Account_getClientDetails}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END

Account Stock Movements from Figaro REST API Data Source Person Service Endpoint getClientDetails service
     Create Session    figarorestapi    ${Figaro_RESTAPI_Default_base_url}     disable_warnings=1
    ${response}=        Get on session        figarorestapi      ${Figaro_RESTAPI_rel_url}
    FOR    ${xml_item}  ${xml_xpath}  ${GPL_item}     IN ZIP    ${Figaro_RESTAPI_Default_attribute}    ${Figaro_RESTAPI_Default_Xpath}     ${GQL_legal_entity_RESTAPI_Default_attribute}
    log  ${xml_item}
    log  ${xml_xpath}
    log  ${Figaro_RESTAPI_Default_attribute}
    ${xm_string}=   Convert To String   ${response.content}
    ${xml_obj}=  Parse Xml    ${xm_string}
    ${text}=  xml.Get Element Attribute    ${xml_obj}  ${xml_item}  ${xml_xpath}
    ${API_Response0}  Create List    ${text}
    ${API_Response1}   listToStringWithoutSquareBrackets     ${API_Response0}
    ${API_Response2}   listToStringwithoutcotes    ${API_Response1}
    ${API_Response}   convertLowercaseToUppercase    ${API_Response2}
    #${value}=  get element text    ${xml_obj}  .//addressLine[1]
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_account_RESTAPI_Default}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response0}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountBankAccountRelationships[0].${GPL_item}
    ${GPQL_Response1}   listToStringWithoutSquareBrackets     ${GPQL_Response0}
    ${GPQL_Response2}   listToStringwithoutcotes    ${GPQL_Response1}
    ${GPQL_Response}   convertLowercaseToUppercase    ${GPQL_Response2}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${API_Response}
    Log     ${GPQL_Response}
      ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
    ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${API_Response}  ${GPQL_Response}
    RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END