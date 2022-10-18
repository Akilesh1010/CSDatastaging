*** Settings ***
Documentation    Account Stock Movements data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Account_StockMovements.robot

*** Test Cases ***

TC.01.Validate Account attributes Figaro JETS getClientDetails service
    Account Stock Movements from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.02.Validate Account1 attributes Figaro JETS getClientDetails service
    Account Stock Movements from Figaro REST API Data Source Person Service Endpoint getClientDetails service



