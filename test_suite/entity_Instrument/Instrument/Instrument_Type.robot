*** Settings ***
Documentation    Instrument Instrument-type data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_Instrument_type.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument type entity attributes validation
    Instrument Instrument type entity attributes validation
