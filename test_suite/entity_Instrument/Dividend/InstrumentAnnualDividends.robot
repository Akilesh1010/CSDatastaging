*** Settings ***
Documentation    Instrument AnnualDividends data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_AnnualDividends.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument AnnualDividends entity attributes validation
    Instrument AnnualDividends entity attributes validation
