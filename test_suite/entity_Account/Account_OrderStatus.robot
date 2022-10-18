*** Settings ***
Documentation    Account Order status  data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/personEntity_entityType.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup  Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Account Order status entity entitytype attributes figaro OLEDB
    Person Entity entitytype figaro OLEDB attributes validation







