*** Settings ***
Documentation    Instrument FundGeography data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundDetails/Instrument_FundGeography.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundGeography entity attributes validation- Fund Sedols
    Instrument FundGeography entity attributes validation- Fund sedols

TC.02.Instrument FundGeography entity attributes validation- Investment Sedols
    Instrument FundGeography entity attributes validation- Investment sedols