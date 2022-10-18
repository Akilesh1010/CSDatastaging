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
Library     ../../../../NewScript/Common/common.py
Resource    ../../../../NewScript/Common/graphql.robot
Library    ../../../../NewScript/Common/SQLtoExcel.py
Resource   ../../../../NewScript/Common/SQLtoExcel.robot
Library    ../../../../NewScript/Common/readexcel.py
Resource   ../../../../NewScript/Common/Read_excel.robot

*** Keywords ***

Instrument DividendPayments entity attributes validation- Investment sedols
    ${row}=     Read number of rows(sql)  Investment
    ${attribute}=     Read number of rows  DividendPayments
    ${data}=    Read Sedol from excel sheet  Investment  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${Sedol}  Read Sedol from excel sheet  Investment  ${i}  1
        FOR   ${j}    IN RANGE   2     ${attribute}+1
      ${DB Query0}  Read Excel Data of Cell  DividendPayments  ${j}  2
      ${DB Query}=  Set Variable   ${DB Query0} '${Sedol}'
      Log to console  ${DB Query}
      ${Source_Table_Script_Output}=              Query      ${DB Query};
      ${GQL_QueryP1}=    Read Excel Data of Cell     DividendPayments  ${j}  3
      ${GQL_QueryP2}=    Read Excel Data of Cell     DividendPayments  ${j}  4
      ${GQL_Query}=  Set Variable   ${GQL_QueryP1}${Sedol}"}}) ${GQL_QueryP2}
      Log to console  ${GQL_Query}
      ${JSON_PATH}=    Read Excel Data of Cell     DividendPayments  ${j}  5
      #${Source_Table_Script_Output}=              Query      ${DB Query};
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
      END

