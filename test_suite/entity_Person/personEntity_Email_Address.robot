*** Settings ***
Documentation    person entity  Email Address data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/person_entity_Email_Address.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate person entity Address attributes Figaro JETS getIndividual service
   Person entity Email Address from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service






