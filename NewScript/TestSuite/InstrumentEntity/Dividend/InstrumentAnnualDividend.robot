*** Settings ***
Documentation    Instrument AnnualDividend data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/Dividend/Instrument_AnnualDividend.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***
TC.01.Instrument AnnualDividend entity attributes validation- Share Sedols
    Instrument AnnualDividend entity attributes validation- Share sedols
