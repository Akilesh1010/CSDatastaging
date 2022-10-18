*** Settings ***
Documentation    Person row count data staging layer validation
Library             SeleniumLibrary

Resource    ../../../resources/sqlserver_stagingDB_dbconnect.robot
Resource    ../../../resources/Person_rowCount.robot


Suite Setup  Connect to stagingDBdatabase

Suite Teardown       Disconnect to stagingDBdatabase

*** Test Cases ***
TC.01.Person entity row count validation
     Person entity stagingDB row validation