*** Settings ***
Documentation    Person Entity Relationship Type Descriptions data staging layer validation
Library             SeleniumLibrary
#Resource    ../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../resources/PersonEntity_relationship_type.robot
#Suite Setup  Connect to csmarketdatabase
#Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Person Entity relationship Type Descriptions entity attributes validation
       Person Entity relationship Type Descriptions entity attributes validation

