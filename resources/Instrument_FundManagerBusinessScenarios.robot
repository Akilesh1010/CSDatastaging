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

Instrument FundManager business scenario-sedol entity attributes validation
    ${row}=     Read number of rows  BS_FundManagerSedol
    ${data}=    Read Excel Data of Cell   BS_FundManagerSedol  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     BS_FundManagerSedol  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     BS_FundManagerSedol  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     BS_FundManagerSedol  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query};
      ${source_DB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      ${source_DB_output2}   listToStringwithoutcotes    ${source_DB_output}
      ${source_DB_output1}    Remove_Whitespace          ${source_DB_output2}

      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output1}=     listToStringwithoutroundfirstbracket      ${GraphQl_Value}

      ${Target_Graphql_Output3}   listToStringwithoutcotes    ${Target_Graphql_Output1}
      ${Target_Graphql_Output4}   fundmanagedbyfundmanagerbs    ${Target_Graphql_Output3}
      ${Target_Graphql_Output5}    fundmanagerbs                 ${Target_Graphql_Output4}
      ${Target_Graphql_Output6}    Remove_Whitespace                 ${Target_Graphql_Output5}

      ${Target_Graphql_Output2}   listToStringWithoutcurleeBracketsfuundmanager    ${Target_Graphql_Output6}



      ##${companyId1}=        listToStringwithoutcotes    ${companyId}

      log  ${source_DB_output1}
      log  ${Target_Graphql_Output2}
      Should Be Equal As Strings    ${result.status_code}    200
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output1}  ${Target_Graphql_Output2}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
      END




Instrument FundManager business scenario- Fund Manager ID entity attributes validation
    ${row}=     Read number of rows  BS_FundManagerID
    ${data}=    Read Excel Data of Cell   BS_FundManagerID  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     BS_FundManagerID  ${i}  2
      ${GQL_Query}=    Read Excel Data of Cell     BS_FundManagerID  ${i}  3
      ${JSON_PATH}=    Read Excel Data of Cell     BS_FundManagerID  ${i}  4
      ${Source_Table_Script_Output}=              Query      ${DB Query};
      ${source_DB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      ${source_DB_output2}   listToStringwithoutcotes    ${source_DB_output}
      ${source_DB_output1}    Remove_Whitespace          ${source_DB_output2}

      ${Headers}=     Create dictionary      Content-Type=application/json;charset=utf-8    Accept=application/json;charset=utf-8
      ${body}=          Create dictionary   query= ${GQL_Query}
      Create Session    graphql    ${base_url}     disable_warnings=1
      ${result}=        Post On Session    graphql    /graphql   json=${body}
      ${value}=      Set Variable  ${result.json()}
      ${GraphQl_Value}=      Get Value From Json     ${value}     ${JSON_PATH}
      ${Target_Graphql_Output1}=     listToStringwithoutroundfirstbracket      ${GraphQl_Value}

      ${Target_Graphql_Output3}   listToStringwithoutcotes    ${Target_Graphql_Output1}
      ${Target_Graphql_Output4}   fundmanagedbyfundmanagerbs    ${Target_Graphql_Output3}
      ${Target_Graphql_Output5}    fundmanagerbs                 ${Target_Graphql_Output4}
      ${Target_Graphql_Output6}    Remove_Whitespace                 ${Target_Graphql_Output5}

      ${Target_Graphql_Output2}   listToStringWithoutcurleeBracketsfuundmanager    ${Target_Graphql_Output6}



      ##${companyId1}=        listToStringwithoutcotes    ${companyId}

      log  ${source_DB_output1}
      log  ${Target_Graphql_Output2}
      Should Be Equal As Strings    ${result.status_code}    200
      ${passed}  ${value}  RUN KEYWORD And Ignore error   Should Be Equal As Strings   ${source_DB_output1}  ${Target_Graphql_Output2}
      RUN KEYWORD IF  "${passed}" == "FAIL"   run keyword And Continue on failure   FAIL
      END


