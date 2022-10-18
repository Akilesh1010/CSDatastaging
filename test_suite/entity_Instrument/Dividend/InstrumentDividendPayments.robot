*** Settings ***
Documentation    Instrument DividendPayments data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_DividendPayments.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument DividendPayments entity attributes validation
    Instrument DividendPayments entity attributes validation
