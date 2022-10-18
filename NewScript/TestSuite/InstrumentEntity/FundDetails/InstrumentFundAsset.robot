*** Settings ***
Documentation    Instrument FundAsset data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundDetails/Instrument_FundAsset.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundAsset entity attributes validation- Fund Sedols
    Instrument FundAsset entity attributes validation- Fund sedols

TC.02.Instrument FundAsset entity attributes validation- Investment Sedols
    Instrument FundAsset entity attributes validation- Investment sedols