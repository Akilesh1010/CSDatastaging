*** Settings ***
Documentation       Order1 Keywords

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
Resource    ../test_data/Order1.robot
Resource    ../mapping/Order1_listOrdersByDate.robot



*** Keywords ***
Order1 from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.
    Create Soap Client     ${Figaro_JETS_listOrdersByDate}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_listOrdersByDate_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Order_listOrdersByDate_attribute}     ${GQL_Order_listOrdersByDate_attribute}
    Continue For Loop If  "${xml_item}" =='quantity' or "${xml_item}" =='consideration' or "${xml_item}" =='netValue' or "${xml_item}"=='price' or "${xml_item}"=='limitPrice' or "${xml_item}"=='commission' or "${xml_item}"=='tax1'


    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
    ${SOAP_Response1}   orderconversion  ${SOAP_Response}


    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Order_listOrdersByDate}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountOrders[0].${GPL_item}
    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response1}
    Log     ${GPQL_Response}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
         ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response1}  ${GPQL_Response}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END
Order1 divide attributes from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.
    Create Soap Client     ${Figaro_JETS_listOrdersByDate}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_listOrdersByDate_XML}

    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Order_listOrdersByDate_attribute}     ${GQL_Order_listOrdersByDate_attribute}
    Continue For Loop If  "${xml_item}"=='mBOS' or "${xml_item}"=='orderType' or "${xml_item}" == 'marketCur' or "${xml_item}"== 'price' or "${xml_item}"== 'limitPrice'

    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
     ${SOAP_Response1}  listToStringwithoutcotes  ${SOAP_Response}
     ${SOAP_Response2}  listToStringWithoutSquareBrackets   ${SOAP_Response1}
     ${SOAP_Response3}   dividetenlakh   ${SOAP_Response2}


    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Order_listOrdersByDate}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}


    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountOrders[0].${GPL_item}
    ${GPQL_Response1}  listToStringWithoutSquareBrackets  ${GPQL_Response}

    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response3}
    Log     ${GPQL_Response1}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
         ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response3}  ${GPQL_Response1}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END







Order1 price attributes from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.
    Create Soap Client     ${Figaro_JETS_listOrdersByDate}
    ${response}    Call SOAP Method With XML    ${Figaro_JETS_listOrdersByDate_XML}
    FOR    ${xml_item}  ${GPL_item}     IN ZIP    ${xml_Order_listOrdersByDate_attribute}     ${GQL_Order_listOrdersByDate_attribute}
    Continue For Loop If  "${xml_item}" =='quantity' or "${xml_item}" =='consideration' or "${xml_item}" =='netValue' or "${xml_item}"=='mBOS' or "${xml_item}"=='orderType' or "${xml_item}"=='commission' or "${xml_item}"=='tax1' or "${xml_item}"=='marketCur'

    ${text}    Get Data From XML By Tag    ${response}    ${xml_item}
    ${SOAP_Response}  Create List    ${text}
     ${SOAP_Response1}  listToStringwithoutcotes  ${SOAP_Response}
     ${SOAP_Response2}  listToStringWithoutSquareBrackets   ${SOAP_Response1}
     ${SOAP_Response3}   dividetenthousand   ${SOAP_Response2}
    ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
    ${body}=        Create dictionary   query= ${Gql_Order_listOrdersByDate}
    Create Session    graphql    ${Grapghql_base_url}    disable_warnings=1
    ${result}=        Post On Session    graphql    /graphql   json=${body}
    ${value}=      Set Variable  ${result.json()}
    ${GPQL_Response}=      Get Value From Json     ${value}     $.data.account.nodes[0].accountOrders[0].${GPL_item}
    ${GPQL_Response1}  listToStringWithoutSquareBrackets  ${GPQL_Response}

    Should Be Equal As Strings    ${result.status_code}    200
    Log     ${SOAP_Response3}
    Log     ${GPQL_Response1}
        ##Continue For Loop If    ${SOAP_Response} == ${GPQL_Response}
         ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${SOAP_Response3}  ${GPQL_Response1}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

    Delete All Sessions
    END


