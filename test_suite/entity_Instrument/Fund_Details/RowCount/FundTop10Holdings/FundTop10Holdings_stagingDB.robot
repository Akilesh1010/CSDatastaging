*** Settings ***
Documentation    Instrument FundTop10Holdings row count data staging layer validation
Library             SeleniumLibrary

Resource    ../../../../../resources/sqlserver_stagingDB_dbconnect.robot
Resource    ../../../../../resources/FundTop10Holdings_rowCount.robot


Suite Setup  Connect to stagingDBdatabase

Suite Teardown       Disconnect to stagingDBdatabase

*** Test Cases ***
TC.01.Instrument FundTop10Holdings entity row count validation
     Instrument FundTop10Holdings entity stagingDB row validation