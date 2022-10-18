*** Settings ***
Documentation    Instrument FundDetails data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_FundDetails.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundDetails entity attributes validation
    Instrument FundDetails entity attributes validation
