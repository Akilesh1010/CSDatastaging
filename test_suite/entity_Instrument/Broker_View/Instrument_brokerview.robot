*** Settings ***
Documentation    Instrument brokerview data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_brokerview.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instruent brokerview entity attributes validation
    Instrument brokerview entity attributes validation
