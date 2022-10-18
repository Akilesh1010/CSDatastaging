*** Settings ***
Documentation       Person to system  Entity Keywords
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
Resource    ../test_data/soapui/person_entity_PersonToSystem.robot
Resource    ../mapping/personEntity_PersonToSysteml.robot


Library    ../common/readexcel.py
Resource   ../common/Read_excel.robot


*** Keywords ***
Person to system entity from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service
    Create Soap Client     ${Figaro_JETS_getIndividual}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getIndividual_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_person_entity_getIndividual_attribute}     ${GQL_person_entity_getIndividual_attribute}


    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_person_entity_getIndividual}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.person.nodes[0].legalEntitySystemRelationships[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
    ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
    RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END

Person to system entity static attrribute validation

    ${row}=     Read number of rows  PersonToSystem
    ${data}=    Read Excel Data of Cell   PersonToSystem  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${Static_Data}=    Read Excel Data of Cell     PersonToSystem  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     PersonToSystem  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     PersonToSystem  ${i}  4
      ${source_DB_output1}   listToStringWithoutRoundBrackets     ${Static_Data}
      ${source_DB_output}   listToStringwithoutcotes    ${source_DB_output1}
      #${source_DB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      #${source_DB_output1}   listToStringwithoutcotes    ${source_DB_output}
      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output1}=     listToStringwithoutroundfirstbracket      ${GraphQl_Value}
      ${Target_Graphql_Output2}=   listToStringwithoutcotes    ${Target_Graphql_Output1}
      ${Target_Graphql_Output3}=    listToStringWithoutSquareBrackets    ${Target_Graphql_Output2}
      ##${companyId1}=        listToStringwithoutcotes    ${companyId}

      log  ${source_DB_output}
      log  ${Target_Graphql_Output3}
      Should Be Equal As Strings    ${result.status_code}    200
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output}  ${Target_Graphql_Output3}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
      END


