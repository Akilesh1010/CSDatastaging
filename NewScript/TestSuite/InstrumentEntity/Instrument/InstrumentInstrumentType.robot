*** Settings ***
Documentation    Instrument InstrumentType data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Instrument/Instrument_InstrumentType.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument InstrumentType entity attributes validation- Fund Sedols
    Instrument InstrumentType entity attributes validation- Fund sedols

TC.02.Instrument InstrumentType entity attributes validation- Investment Sedols
    Instrument InstrumentType entity attributes validation- Investment sedols

TC.03.Instrument InstrumentType entity attributes validation- Shares Sedols
    Instrument InstrumentType entity attributes validation- Shares sedols

TC.04.Instrument InstrumentType entity attributes validation- BondandGilts Sedols
    Instrument InstrumentType entity attributes validation- BondandGilts sedols