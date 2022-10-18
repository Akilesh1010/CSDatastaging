*** Settings ***
Documentation    Instrument FundManager data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundManager/Instrument_FundManager.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundManager entity attributes validation- Fund Sedols
    Instrument FundManager entity attributes validation- Fund sedols

TC.02.Instrument FundManager entity attributes validation- Investment Sedols
    Instrument FundManager entity attributes validation- Investment sedols