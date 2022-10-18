*** Settings ***
Documentation    Instrument Fund Top Ten Holding data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundDetails/Instrument_FundTopTenHolding.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundTopTenHolding entity attributes validation- Fund Sedols
    Instrument FundTopTenHolding entity attributes validation- Fund sedols

TC.02.Instrument FundTopTenHolding entity attributes validation- Investment Sedols
    Instrument FundTopTenHolding entity attributes validation- Investment sedols