*** Settings ***
Documentation    Instrument InstrumentIndex data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Instrument/Instrument_InstrumentIndex.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***

TC.01.Instrument InstrumentIndex entity attributes validation- Shares Sedols
   Instrument InstrumentIndex entity attributes validation- Shares sedols

