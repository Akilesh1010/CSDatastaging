*** Settings ***
Documentation       Instrument Entity Keywords
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
Library    ../common/readexcel.py
Resource   ../common/Read_excel.robot

*** Keywords ***

Instrument FundAsset entity attributes validation
    ${row}=     Read number of rows  FundAsset
    ${data}=    Read Excel Data of Cell   FundAsset  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     FundAsset  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     FundAsset  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     FundAsset  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query};
      ${source_DB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      ${source_DB_output1}   listToStringwithoutcotes    ${source_DB_output}
      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output1}=     listToStringwithoutroundfirstbracket      ${GraphQl_Value}
      ${Target_Graphql_Output2}   listToStringwithoutcotes    ${Target_Graphql_Output1}
      ##${companyId1}=        listToStringwithoutcotes    ${companyId}

      log  ${source_DB_output1}
      log  ${Target_Graphql_Output2}
      Should Be Equal As Strings    ${result.status_code}    200
       ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output1}  ${Target_Graphql_Output2}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
      END

