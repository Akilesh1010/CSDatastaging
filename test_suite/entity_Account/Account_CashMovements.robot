*** Settings ***
Documentation    Account Cash Movements data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Account_CashMovements.robot

*** Test Cases ***

TC.01.Validate Account cash Movements attributes Figaro JETS getClientDetails service
    Account Cash Movements from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.02.Validate Account1 attributes Figaro JETS getClientDetails service
    Account Cash Movements from Figaro REST API Data Source Person Service Endpoint getClientDetails service



