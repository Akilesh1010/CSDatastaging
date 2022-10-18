*** Settings ***
Documentation    Instrument FundManagedByFundManager data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../NewScript/Resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../../../NewScript/Resources/Instrument/FundManager/Instrument_FundManagedByFundManager.robot
Suite Setup  Connect to csmarketdatabase
Suite Teardown       Disconnect from csmarketdatabase

*** Test Cases ***

Scenario: sedols
GIVEN Fund Manager data is being retrieved
WHEN SEDOL is specified
THEN Funds Managed by Fund Manager sub-entity data is returned for the specified Sedol
AND Fund Manager sub-entity data is returned for the fund managers who manage the instrument identified by the specified Sedol

