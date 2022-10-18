*** Settings ***
Documentation    Person entity Identification Document data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/personEntity_IdentificationDocument.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Person entity IdentificationDocument attributes figaro OLEDB
       Person Entity IdentificationDocument figaro OLEDB attributes validation






