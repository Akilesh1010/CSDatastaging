*** Settings ***
Documentation    Instrument DividendPayments data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Dividend/Instrument_DividendPayments.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument DividendPayments entity attributes validation- Investment Sedols
    Instrument DividendPayments entity attributes validation- Investment sedols
