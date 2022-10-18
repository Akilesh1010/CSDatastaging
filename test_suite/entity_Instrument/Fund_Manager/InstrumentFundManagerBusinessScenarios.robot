*** Settings ***
Documentation    Instrument FundManager Business scenarios data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../resources/Instrument_FundManagerBusinessScenarios.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundManager business scenario-sedol entity attributes validation
       Instrument FundManager business scenario-sedol entity attributes validation
TC.02.Instrument FundManager business scenario- Fund Manager ID entity attributes validation
       Instrument FundManager business scenario- Fund Manager ID entity attributes validation
