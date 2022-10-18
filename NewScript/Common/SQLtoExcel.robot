#*** Settings ***
#Documentation    SQL to Excel
#Library             SeleniumLibrary
#Resource    ../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
#Suite Setup  Connect to csmarketdatabase
#Suite Teardown       Disconnect from csmarketdatabase

*** Keywords ***
Read number of rows(sql)
    [Arguments]  ${Sheetname}
    ${max}=  fetch_number_of_rows_sql   ${Sheetname}
    [Return]  ${max}

Read Sedol from excel sheet
    [Arguments]     ${Sheetname}    ${row}  ${cell}
    ${celldata}=    fetch_cell_data_sql     ${Sheetname}    ${row}  ${cell}
    [Return]    ${celldata}
#run sql query
#read number of rows
#fetch cell data -sedols
#save sedols in excel