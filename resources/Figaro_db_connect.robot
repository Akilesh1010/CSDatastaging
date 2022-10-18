*** Settings ***
Documentation       DB Suite
Library             OperatingSystem
Library             SeleniumLibrary
Library             DatabaseLibrary
Library             pyodbc
Resource    ../common/figarodb.robot

*** Keywords ***
Connect to oledatabase
    Connect To Database Using Custom Params   pyodbc    ${iseriesDBHost_ConnectionString}
    ##${Source_Table_Script_Output}=              Query      SELECT * FROM ACTIVECSL.PERSON where UECODE='O0790041000'


Disconnect to oledatabase
    Disconnect From Database