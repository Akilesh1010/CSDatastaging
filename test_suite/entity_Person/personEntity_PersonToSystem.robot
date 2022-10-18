*** Settings ***
Documentation    person To System  data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/personEntity_PersonToSystem.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate person to system entity attributes Figaro JETS getIndividual service
     Person to system entity from Figaro JETS Data Source Client Inception Service Endpoint getIndividual service
TC.01.Validate person to system entity static attribute
     Person to system entity static attrribute validation





