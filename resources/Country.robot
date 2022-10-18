*** Settings ***
Documentation       Country Keywords

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
Resource    ../test_data/Country.robot
Resource    ../mapping/Country_getCountryList.robot



*** Keywords ***
Country from Figaro JETS Data Source Market Service Endpoint getCountryList service
    Create Soap Client     ${Figaro_JETS_getCountryList}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_getCountryList_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Country_getCountryList_attribute}     ${GQL_Country_getCountryList_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Country_getCountryList}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response1}=      Get Value From Json     ${value}      $.data.person.nodes[0].countryOfBirthNavigation.${GPL_item}
    ${GPQL_Response}      allUpper       ${GPQL_Response1}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
    Delete All Sessions
    END

