*** Settings ***
Documentation    Person entity tax residences data staging layer validation
Library             SeleniumLibrary
Resource     ../../resources/personEntityTaxResidence.robot


*** Test Cases ***
TC.01.Validate Person entity tax residences attributes Figaro JETS getIndividual service
     Person entity taxresidences from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service

TC.02.Validate Person entity tax residences boolean static attribute
     Person Tax residence entity boolean static attrribute validation



