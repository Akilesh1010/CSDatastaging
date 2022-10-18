*** Settings ***
Documentation    Instrument Instrument data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Instrument/Instrument_Instrument.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument Instrument entity attributes validation- Fund Sedols
    Instrument Instrument entity attributes validation- Fund sedols

TC.02.Instrument Instrument entity attributes validation- Investment Sedols
    Instrument Instrument entity attributes validation- Investment sedols

TC.03.Instrument Instrument entity attributes validation- Shares Sedols
    Instrument Instrument entity attributes validation- Shares sedols

TC.04.Instrument Instrument entity attributes validation- BondandGilts Sedols
    Instrument Instrument entity attributes validation- BondandGilts sedols