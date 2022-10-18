*** Settings ***
Documentation       Person Entity IdentificationDocument Keywords
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
Library    ../common/readexcel.py
Resource   ../common/Read_excel.robot


*** Keywords ***

Person Entity IdentificationDocument figaro OLEDB attributes validation
    ${row}=     Read number of rows  IdentificationDocument
    ${data}=    Read Excel Data of Cell   IdentificationDocument  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     IdentificationDocument  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     IdentificationDocument  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     IdentificationDocument  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query}
      ${source_DB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
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
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output}  ${Target_Graphql_Output1}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

      END

