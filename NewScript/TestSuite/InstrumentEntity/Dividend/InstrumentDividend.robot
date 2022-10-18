*** Settings ***
Documentation    Instrument Dividend data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Dividend/Instrument_Dividend.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument Dividend entity attributes validation- Fund Sedols
    Instrument Dividend entity attributes validation- Fund sedols
