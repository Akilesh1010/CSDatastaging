*** Settings ***
Documentation    Instrument FundSector data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_FundSector.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundSector entity attributes validation
    Instrument FundSector entity attributes validation
