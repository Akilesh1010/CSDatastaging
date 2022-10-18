*** Settings ***
Documentation       DB Suite
Library             OperatingSystem
Library             SeleniumLibrary
Library             DatabaseLibrary
Library             pyodbc
Resource    ../common/sqlserver_CSDirectWebApps.robot

*** Keywords ***
Connect to CSDirectWebAppsdatabase
    Connect To Database Using Custom Params   pyodbc    ${DBHost_ConnectionString}

Disconnect to CSDirectWebAppsdatabase
    Disconnect From Database
