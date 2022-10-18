*** Settings ***
Documentation       Country MiFID Requirement Keywords

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
Library    ../common/Countryreadexcel.py
Resource   ../common/Read_excel.robot



*** Keywords ***
Country MiFID Requirement figaro OLEDB attributes validation yay
    ${row}=     Read number of rows  CountryMiFIDRequirement
    ${data}=    Read Excel Data of Cell   CountryMiFIDRequirement  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     CountryMiFIDRequirement  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     CountryMiFIDRequirement  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     CountryMiFIDRequirement  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query}
      ${source_DB_output0}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      ${source_DB_output1}   listToStringwithoutcotes     ${source_DB_output0}
      ${source_DB_output2}   listToStringwithoutroundlastbracket     ${source_DB_output1}
      ${source_DB_output3}   listToStringWithoutdecimal     ${source_DB_output2}
      ${source_DB_output}   Remove_Whitespace     ${source_DB_output3}

      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      #${Target_Graphql_Output}=   listToStringWithoutspace  ${GraphQl_Value}
      ${Target_Graphql_Output0}=     listToStringwithoutroundfirstbracket      ${GraphQl_Value}
      ${Target_Graphql_Output}   listToStringwithoutcotes     ${Target_Graphql_Output0}
       ${Target_Graphql_Output1}   Remove_Whitespace     ${Target_Graphql_Output}
      ##${companyId1}=        listToStringwithoutcotes    ${companyId}
      log  ${source_DB_output}
      log  ${Target_Graphql_Output1}
      Should Be Equal As Strings    ${result.status_code}    200
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output}   ${Target_Graphql_Output1}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL

      END
