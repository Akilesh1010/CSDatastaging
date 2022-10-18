*** Settings ***
Documentation    Instrument TradeCondition data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_TradeCondition.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument TradeCondition entity attributes validation
    Instrument TradeCondition entity attributes validation
