*** Settings ***
Documentation    Instrument FundAsset data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../resources/Marketindex_Constituents.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Market index Constituents entity attributes validation
    Market index Constituents entity attributes validation
