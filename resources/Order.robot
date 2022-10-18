*** Settings ***
Documentation       Order Keywords

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
Resource    ../test_data/Order.robot
Resource    ../mapping/Order_listOrdersByDate.robot



*** Keywords ***
Order from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.
    Create Soap Client     ${Figaro_JETS_listOrdersByDate}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_listOrdersByDate_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Order_listOrdersByDate_attribute}     ${GQL_Order_listOrdersByDate_attribute}
    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}

    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Order_listOrdersByDate}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountOrders[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
         ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END

