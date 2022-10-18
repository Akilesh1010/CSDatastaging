*** Settings ***
Documentation    Country Native Language Identity Type Descriptions data staging layer validation
Library             SeleniumLibrary
#Resource    ../../resources/sqlserver_csmaraketdata_dbconnect.robot
Resource    ../../resources/Country_NativeLanguageIdentityTypeDescriptions.robot
#Suite Setup  Connect to csmarketdatabase
#Suite Teardown       Disconnect to csmarketdatabase

*** Test Cases ***
TC.01.Country Native Language Identity Type Descriptions entity attributes validation
    Country Native Language Identity Type Descriptions entity attributes validation
