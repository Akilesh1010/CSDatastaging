*** Settings ***
Documentation       DB Suite
Library             OperatingSystem
Library             SeleniumLibrary
Library             DatabaseLibrary
Library             pyodbc
Resource    ../common/sqlserver_stagingDB.robot

*** Keywords ***
Connect to stagingDBdatabase
    Connect To Database Using Custom Params   pyodbc    ${DBHost_ConnectionString}

Disconnect to stagingDBdatabase
    Disconnect From Database
