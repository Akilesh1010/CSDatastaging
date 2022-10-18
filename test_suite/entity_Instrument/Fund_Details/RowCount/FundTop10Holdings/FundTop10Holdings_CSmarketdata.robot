*** Settings ***
Documentation    Instrument FundTop10Holdings row count data staging layer validation
Library             SeleniumLibrary
Resource    ../../../../../resources/sqlserver_csmaraketdata_dbconnect.robot

Resource    ../../../../../resources/FundTop10Holdings_rowCount.robot

Suite Setup  Connect to csmarketdatabase

Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Instrument FundTop10Holdings entity row count validation
     Instrument FundTop10Holdings entity CSMarketdata row validation
