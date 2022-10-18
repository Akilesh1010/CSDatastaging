*** Settings ***
Documentation    Instrument FundManagedByFundManager data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundManager/Instrument_FundManagedByFundManager.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundManagedByFundManager entity attributes validation- Fund Sedols
    Instrument FundManagedByFundManager entity attributes validation- Fund sedols

TC.02.Instrument FundManagedByFundManager entity attributes validation- Investment Sedols
    Instrument FundManagedByFundManager entity attributes validation- Investment sedols