*** Settings ***
Documentation    Legal entity Bank Account Relationship data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/LegalEntityBankAccountRelationship.robot


*** Test Cases ***

TC.01.Validate Legal entity Bank Account Relationship attributes Figaro JETS getIndividual service
    Legal Entity Bank Account Relationship from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service

#TC.02.Validate Legal entity Bank Account Relationship BankAccountKey attributes Figaro JETS getIndividual service
    #Legal Entity Bank Account Relationship BankAccountKey from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service

#TC.03.Validate Legal entity Bank Account Relationship attributes Figaro JETS getClientDetails service
   #Legal Entity Bank Account Relationship from Figaro JETS Data Source Person Service Endpoint getClientDetails service

#TC.04.Validate Legal entity Bank Account Relationship BankAccountKey attributes Figaro JETS getClientDetails service
   #Legal Entity Bank Account Relationship BankAccountKey from Figaro JETS Data Source Person Service Endpoint getClientDetails service

TC.02.Validate Legal Entity Bank Account Relationship attributes Figaro RESTAPI getIndividual service
    Legal Entity Bank Account Relationship figaro RESTAPI GET individual





