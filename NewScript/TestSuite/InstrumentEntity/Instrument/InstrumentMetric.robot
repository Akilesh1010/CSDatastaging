*** Settings ***
Documentation    Instrument InstrumentMetric data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Instrument/Instrument_Metric.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***

TC.01.Instrument Metric entity attributes validation- Investment Sedols
    Instrument Metric entity attributes validation- Investment sedols

TC.02.Instrument Metric entity attributes validation- Shares Sedols
    Instrument Metric entity attributes validation- Shares sedols
