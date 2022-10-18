*** Settings ***
Documentation    Person entity  Tax Identification Number  data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/personEntity_TaxIdentificationNumber.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Person entity TaxIdentificationNumber attributes figaro OLEDB
       Person Entity TaxIdentificationNumber figaro OLEDB attributes validation






