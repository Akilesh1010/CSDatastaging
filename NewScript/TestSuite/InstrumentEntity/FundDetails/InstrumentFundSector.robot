*** Settings ***
Documentation    Instrument FundSector data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundDetails/Instrument_FundSector.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundSector entity attributes validation- Fund Sedols
    Instrument FundSector entity attributes validation- Fund sedols

TC.02.Instrument FundSector entity attributes validation- Investment Sedols
    Instrument FundSector entity attributes validation- Investment sedols