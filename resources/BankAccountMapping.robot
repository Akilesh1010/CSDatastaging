*** Settings ***
Documentation       Bank Account Mapping Keywords

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
Resource    ../test_data/AccountBankAccountRelationship.robot
Resource    ../mapping/AccountBankAccountRelationship_getClientDetails.robot
Resource    ../mapping/AccountBankAccountRelationship_Default_figaro_restapi.robot
Resource    ../mapping/AccountBankAccountRelationship_Payment_figaro_restapi.robot



*** Keywords ***
Bank Account Mapping from Figaro JETS Data Source Person Service Endpoint getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_AccountBankAccountRelationship_getClientDetails_attribute}     ${GQL_AccountBankAccountRelationship_getClientDetails_attribute}
    Continue For Loop If  "${xml_item}" =='bankAccNumber'
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_AccountBankAccountRelationship_getClientDetails}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountBankAccountRelationships[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END

Bank Account Mapping BankAccountKey from Figaro JETS Data Source Person Service Endpoint getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_AccountBankAccountRelationship_getClientDetails_attribute}     ${GQL_AccountBankAccountRelationship_getClientDetails_attribute}
    Continue For Loop If  "${xml_item}" =='clientNumber'
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response0}  Create List    ${text}
    ${SOAP_Response1}   listToStringWithoutSquareBrackets     ${SOAP_Response0}
    ${SOAP_Response}   listToStringwithoutcotes    ${SOAP_Response1}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_AccountBankAccountRelationship_getClientDetails}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response0}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountBankAccountRelationships[0].${GPL_item}
     ${GPQL_Response}  getSubstring  ${GPQL_Response0}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END


Bank Account Mapping figaro RESTAPI Default
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


Bank Account Mapping figaro RESTAPI Payment
    Create Session    figarorestapi    ${Figaro_RESTAPI_Payment_base_url}     disable_warnings=1
    ${response}=        Get on session        figarorestapi      ${Figaro_RESTAPI_Payment_rel_url}
    FOR    ${xml_item}  ${xml_xpath}  ${GPL_item}     IN ZIP    ${Figaro_RESTAPI_Payment_attribute}    ${Figaro_RESTAPI_Payment_Xpath}     ${GQL_legal_entity_RESTAPI_Payment_attribute}
    log  ${xml_item}
    log  ${xml_xpath}
    log  ${Figaro_RESTAPI_Payment_attribute}
    ${xm_string}=   Convert To String   ${response.content}
    ${xml_obj}=  Parse Xml    ${xm_string}
    ${text}=  xml.Get Element Attribute    ${xml_obj}  ${xml_item}  ${xml_xpath}
    ${API_Response0}  Create List    ${text}
    ${API_Response1}   listToStringWithoutSquareBrackets     ${API_Response0}
    ${API_Response2}   listToStringwithoutcotes    ${API_Response1}
    ${API_Response}   convertLowercaseToUppercase    ${API_Response2}
    #${value}=  get element text    ${xml_obj}  .//addressLine[1]
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_account_RESTAPI_Payment}
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

