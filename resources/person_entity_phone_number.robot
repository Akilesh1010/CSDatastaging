*** Settings ***
Documentation       Person Entity  phone number Keywords
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
Resource    ../test_data/person_entity_phone_number.robot
Resource    ../mapping/personEntity_phone_number_getIndividual.robot


Library    ../common/readexcel.py
Resource   ../common/Read_excel.robot


*** Keywords ***
Person entity phone number Address from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service
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
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.person.nodes[0].telephoneNumbers[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
    ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
    RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END



