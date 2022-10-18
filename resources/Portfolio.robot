*** Settings ***
Documentation       Portfolio Keywords
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
Resource    ../test_data/Portfolio.robot
Resource    ../mapping/Portfolio_getClientDetails.robot
Resource    ../common/graphql.robot
Library     ../common/readexcel.py
Resource    ../common/Read_excel.robot




*** Keywords ***
Portfolio from Figaro JETS Data Source Person Service End Point getClientDetails service
    Create Soap Client     ${Figaro_JETS_getClientDetails}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getClientDetails_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Portfolio_getClientDetails_attribute}     ${GQL_Portfolio_getClientDetails_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Portfolio_getClientDetails}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].portfolioCodeNavigation.${GPL_item}
    #${GPQL_Response}=       Remove_Whitespace                              ${GPQL_Response1}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
        ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END


Portfolio figaro RESTAPI GETportfolio
    Create Session    figarorestapi    ${Figaro_RESTAPI_GETportfolio_base_url}     disable_warnings=1
    ${response}=        Get on session        figarorestapi      ${Figaro_RESTAPI_rel_url}
    FOR    ${xml_item}  ${xml_xpath}  ${GPL_item}     IN ZIP    ${Figaro_RESTAPI_GETportfolio_attribute}    ${Figaro_RESTAPI_GETportfolio_Xpath}     ${GQL_portfolio_RESTAPI_GETportfolio_attribute}
    log  ${xml_item}
    log  ${xml_xpath}
    log  ${Figaro_RESTAPI_GETportfolio_attribute}
    ${xm_string}=   Convert To String   ${response.content}
    log  ${xm_string}
    ${xml_obj}=  Parse Xml    ${xm_string}
    ${text}=  xml.Get Element Attribute    ${xml_obj}  ${xml_item}  ${xml_xpath}
    ${API_Response0}  Create List    ${text}
    ${API_Response1}   listToStringWithoutSquareBrackets     ${API_Response0}
    ${API_Response2}   listToStringwithoutcotes    ${API_Response1}
    ${API_Response}   convertLowercaseToUppercase    ${API_Response2}
    #${value}=  get element text    ${xml_obj}  .//addressLine[1]
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_portfolio_RESTAPI_GETportfolio}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response0}=      Get Value From Json     ${value}     $.data.account.nodes[0].portfolioCodeNavigation.${GPL_item}
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

Portfolio Entity figaro OLEDB attributes validation
    ${row}=     Read number of rows  Portfolio
    ${data}=    Read Excel Data of Cell   Portfolio  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell      Portfolio  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     Portfolio  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     Portfolio  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query}
       ${source_DB_output1}   listToStringwithoutcotes  ${Source_Table_Script_Output}
       ${source_DB_output}   listToStringWithoutRoundBrackets     ${source_DB_output1}
        # ${source_DB_output}      Remove_Whitespace                   ${source_DB_output1}
      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output1}=      listToStringwithoutcotes  ${GraphQl_Value}
      ${Target_Graphql_Output}=     listToStringwithoutroundfirstbracket    ${Target_Graphql_Output1}

      ##${companyId1}=        listToStringwithoutcotes    ${companyId}
      log  ${source_DB_output}
      log  ${Target_Graphql_Output}
      Should Be Equal As Strings    ${result.status_code}    200
          ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output}  ${Target_Graphql_Output}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

      END



