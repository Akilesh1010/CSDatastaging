*** Settings ***
Documentation    Person entity accountrelationship data staging layer validation
Library             SeleniumLibrary
Resource     ../../resources/personEntity_accountrelationship.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup  Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***

TC.01.Validate Person entity accountrelationship1 attributes Figaro OLEDB attributes validation
      Person Entity accountrelationship1 figaro OLEDB attributes validation
TC.02.Validate Person entity boolean attributes accountrelationship2 attributes Figaro OLEDB attributes validation
      Person Entity boolean attributes accountrelationship2 figaro OLEDB attributes validation







