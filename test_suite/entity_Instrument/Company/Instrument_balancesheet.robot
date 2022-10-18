*** Settings ***
Documentation    Instrument Balance Sheet data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_balancesheet.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instruent balancesheet entity attributes validation
    Instrument BalanceSheet entity attributes validation
