*** Settings ***
Documentation    Bank Account Mapping data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/BankAccountMapping.robot


*** Test Cases ***


TC.01.Validate Bank Account Mapping entity attributes Figaro JETS getClientDetails service
   Bank Account Mapping from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.02.Validate Bank Account Mapping BankAccountKey entity attributes Figaro JETS getClientDetails service
   Bank Account Mapping BankAccountKey from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.03.Validate Bank Account Mapping attributes Figaro RESTAPI Default service
    Bank Account Mapping figaro RESTAPI Default

TC.04.Validate Bank Account Mapping attributes Figaro RESTAPI Payment service
   Bank Account Mapping figaro RESTAPI Payment






