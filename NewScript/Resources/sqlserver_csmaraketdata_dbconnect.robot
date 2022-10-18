*** Settings ***
Documentation       DB Suite
Library             OperatingSystem
Library             SeleniumLibrary
Library             DatabaseLibrary
Library             pyodbc
Resource    ../common/sqlserver_csmarketData.robot

*** Keywords ***
Connect to csmarketdatabase
    Connect To Database Using Custom Params   pyodbc    ${DBHost_ConnectionString}

Disconnect from csmarketdatabase
    Disconnect From Database
