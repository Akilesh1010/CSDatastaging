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
#Resource    ../common/graphql.robot
Library    ../common/readexcel.py
Resource   ../common/Read_excel.robot

*** Keywords ***

Instrument FundTop10Holdings entity CSMarketdata row validation
    ${row}=     Read number of rows  rowCount
    ${data}=    Read Excel Data of Cell   rowCount  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1
      ${DB Query}=    Read Excel Data of Cell     rowCount  ${i}  2

      ${Source_Table_Script_Output}=              Query      ${DB Query};
      ${source_DB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output}
      ${source_DB_output1}   listToStringwithoutcotes    ${source_DB_output}



      log  ${source_DB_output1}


      END

Instrument FundTop10Holdings entity stagingDB row validation
    ${row}=     Read number of rows  rowCount
    ${data}=    Read Excel Data of Cell   rowCount  1  1
      FOR   ${i}    IN RANGE   2     ${row}+1

      ${SDB_Query}=    Read Excel Data of Cell     rowCount  ${i}  3


      ${Source_Table_Script_Output1}=              Query      ${SDB Query};
      ${source_SDB_output}   listToStringWithoutRoundBrackets     ${Source_Table_Script_Output1}
      ${source_SDB_output1}   listToStringwithoutcotes    ${source_SDB_output}





      log  ${source_SDB_output1}

      END

