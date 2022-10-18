*** Settings ***
Documentation    Instrument IncomeStatement Entity data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_IncomeStatement.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument Income Statement entity attributes validation
    Instrument IncomeStatement entity attributes validation
