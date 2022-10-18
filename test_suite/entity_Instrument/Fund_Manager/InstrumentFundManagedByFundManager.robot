*** Settings ***
Documentation    Instrument FundManagedByFundManager data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_FundManagedByFundManager.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundManagedByFundManager entity attributes validation
    Instrument FundManagedByFundManager entity attributes validation
