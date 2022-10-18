*** Settings ***

Documentation    Instrument Dividend details data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/instrumentdividend1.robot
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase


*** Test Cases ***
TC.01.Instrument Dividend details entity attributes validation
    instrument dividend details

