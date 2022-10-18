*** Settings ***
Documentation    Instrument FundTop10Holdings data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_FundTop10Holdings.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundTop10Holdings entity attributes validation
    Instrument FundTop10Holdings entity attributes validation
