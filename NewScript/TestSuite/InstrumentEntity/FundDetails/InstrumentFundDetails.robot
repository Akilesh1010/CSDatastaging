*** Settings ***
Documentation    Instrument FundDetails data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundDetails/Instrument_FundDetails.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundDetails entity attributes validation- Fund Sedols
    Instrument FundDetails entity attributes validation- Fund sedols

TC.02.Instrument FundDetails entity attributes validation- Investment Sedols
    Instrument FundDetails entity attributes validation- Investment sedols