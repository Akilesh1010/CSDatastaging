*** Settings ***
Documentation    person entity data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/person_entity.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate person entity attributes Figaro JETS getIndividual service
    Person entity from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service
TC.02.Validate person entity attributes figaro OLEDB
    Person Entity figaro OLEDB attributes validation
TC.03.Validate person entity boolean attribute figaro JETS getIndividual service
    Person entity AML Check Passed attribute from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service
TC.04.Validate person entity Country of residence attribute figaro JETS getIndividual service
     Person entity Country of Residence from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service







