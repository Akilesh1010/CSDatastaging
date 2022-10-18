*** Keywords ***
Read number of rows
    [Arguments]  ${Sheetname}
    ${max}=  fetch_number_of_rows   ${Sheetname}
    [Return]  ${max}

Read Excel Data of Cell
    [Arguments]     ${Sheetname}    ${row}  ${cell}
    ${celldata}=    fetch_cell_data     ${Sheetname}    ${row}  ${cell}
    [Return]    ${celldata}
