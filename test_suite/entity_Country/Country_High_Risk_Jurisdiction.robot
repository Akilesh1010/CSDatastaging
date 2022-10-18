*** Settings ***
Documentation    Country High Risk Jurisdiction data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/sqlserver_CSDirectWebApps_dbconnect.robot
Resource    ../../resources/Country_High_Risk_Jurisdiction.robot
Suite Setup  Connect to CSDirectWebAppsdatabase
Suite Teardown       Disconnect to CSDirectWebAppsdatabase

*** Test Cases ***
TC.01.Country High Risk Jurisdiction entity attributes validation12
    Country High Risk Jurisdiction entity attributes validation
