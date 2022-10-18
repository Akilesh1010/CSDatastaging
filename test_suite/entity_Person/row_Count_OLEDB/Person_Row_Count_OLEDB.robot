*** Settings ***
Documentation    Person row count data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/Figaro_db_connect.robot

Resource    ../../../resources/Person_rowCount.robot

Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase


*** Test Cases ***
TC.01.Person entity row count validation
     Person entity OLEDB row validation

