*** Settings ***
Documentation    AccountBankAccountRelationshipdata staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/AccountBankAccountRelationship.robot

*** Test Cases ***

TC.01.Validate Account Bank Account Relationship entity attributes Figaro JETS getClientDetails service
   Account Bank Account Relationship from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.02.Validate Account Bank Account Relationship BankAccountKey entity attributes Figaro JETS getClientDetails service
   Account Bank Account Relationship BankAccountKey from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.03.Validate Account Bank Account Relationship attributes Figaro RESTAPI Default service
    Account Bank Account Relationship figaro RESTAPI Default

TC.04.Validate Account Bank Account Relationship attributes Figaro RESTAPI Payment service
   Account Bank Account Relationship figaro RESTAPI Payment


