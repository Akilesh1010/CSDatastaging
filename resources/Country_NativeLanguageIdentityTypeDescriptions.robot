*** Settings ***
Documentation       Country Native Language Identity Type Descriptions Entity Keywords
Library             OperatingSystem
Library             SeleniumLibrary
Library             DatabaseLibrary
Library             pyodbc
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Library             OperatingSystem
Library             string
Library             XML
Library     ../common/common.py
Resource    ../common/graphql.robot
Library    ../common/Countryreadexcel.py
Resource   ../common/Read_excel.robot

*** Keywords ***

Country Native Language Identity Type Descriptions entity attributes validation
    ${row}=     Read number of rows  NLITDStaticData
    ${data}=    Read Excel Data of Cell   NLITDStaticData  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${Static_Data}=    Read Excel Data of Cell     NLITDStaticData  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     NLITDTestData  ${i}  2
      ${JSON_PATH}=    Read Excel Data of Cell     NLITDTestData  ${i}  3
      ${source_DB_output1}   listToStringWithoutRoundBrackets     ${Static_Data}
      ${source_DB_output}   listToStringwithoutcotes    ${source_DB_output1}
      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output1}=     listToStringWithoutSquareBrackets     ${GraphQl_Value}
      ${Target_Graphql_Output2}   listToStringwithoutcotes    ${Target_Graphql_Output1}
      ##${companyId1}=        listToStringwithoutcotes    ${companyId}
      log  ${source_DB_output1}
      log  ${Target_Graphql_Output2}
      Should Be Equal As Strings    ${result.status_code}    200
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output1}  ${Target_Graphql_Output2}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
      END

