*** Settings ***
Documentation    Country Nationality data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/sqlserver_CSDirectWebApps_dbconnect.robot
Resource    ../../resources/Country_Nationality.robot
Suite Setup  Connect to CSDirectWebAppsdatabase
Suite Teardown       Disconnect to CSDirectWebAppsdatabase

*** Test Cases ***
TC.01.Country Nationality entity attributes validation
    Country Nationality entity attributes validation
