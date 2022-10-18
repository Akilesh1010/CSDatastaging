*** Settings ***
Documentation    Person entity nationality data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/person_entity_nationality.robot
Resource  ../../resources/Figaro_db_connect.robot
Suite Setup  Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***

TC.01.Validate Person nationality entity nationality attributes Figaro getIndividual service
      Person nationality entity from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service
TC.01.Validate Person nationality entity nationality boolean attribute validation
      Person nationality entity bollean static attrribute validation






