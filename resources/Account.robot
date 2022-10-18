*** Settings ***
Documentation       Account Keywords

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
Resource    ../common/graphql.robot
Resource    ../test_data/Account.robot
Library    ../common/readexcel.py
Resource    ../mapping/Account_getClientDetails.robot
Resource   ../common/Read_excel.robot




*** Keywords ***
Account from Figaro JETS Data Source Person Service Endpoint getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Account_getClientDetails_attribute}     ${GQL_Account_getClientDetails_attribute}
    Continue For Loop If  "${xml_item}" =='personResponsibleCode' or "${xml_item}" =='productCode'
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


Account isPPSAccount from Figaro JETS Data Source Person Service Endpoint getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Account_getClientDetails_IsPPSAccount_attribute}     ${GQL_Account_getClientDetails_IsPPSAccount_attribute}

    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response1}  Create List    ${text}
    ${SOAP_Response2}      isppsaccountconversion       ${SOAP_Response1}
    ${SOAP_Response}   listToStringwithoutcotes    ${SOAP_Response2}
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


Account Entity figaro OLEDB attributes validation
    ${row}=     Read number of rows  Account
    ${data}=    Read Excel Data of Cell   Account  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     Account  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     Account  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     Account  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query}
      ${source_DB_output1}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      ${source_DB_output}   fivespacestoNONE     ${source_DB_output1}
      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output}=   listToStringWithoutspace  ${GraphQl_Value}
      ${Target_Graphql_Output1}=     listToStringwithoutroundfirstbracket      ${Target_Graphql_Output}
      ##${companyId1}=        listToStringwithoutcotes    ${companyId}
      log  ${source_DB_output}
      log  ${Target_Graphql_Output1}
      Should Be Equal As Strings    ${result.status_code}    200
      Should Be Equal As Strings     ${source_DB_output}    ${Target_Graphql_Output1}
      END

Account Service Type from Figaro JETS Data Source Person Service Endpoint getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Account_getClientDetails_serviceType_attribute}     ${GQL_Account_getClientDetails_serviceType_attribute}


    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response1}  Create List    ${text}
    ${SOAP_Response}  serviceTypeconversion    ${SOAP_Response1}
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


Account Tax cost from Figaro JETS Data Source Portfolio Services end point getClientPortfolio service
    Create Soap Client     ${Figaro_JETS_getClientPortfolio}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientPortfolio_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Account_getClientPortfolio_taxCost_attribute}     ${GQL_Account_getClientPortfolio_taxCost_attribute}


    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response3}   Create List     ${text}
    ${SOAP_Response2}   listToStringwithoutcotes       ${SOAP_Response3}
    ${SOAP_Response1}    listToStringWithoutSquareBrackets   ${SOAP_Response2}
    ${SOAP_Response}      dividetenlakh               ${SOAP_Response1}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Account_getClientPortfolio}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response1}=      Get Value From Json     ${value}     $.data.account.nodes[0].${GPL_item}
    ${GPQL_Response}        listToStringWithoutSquareBrackets           ${GPQL_Response1}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END


