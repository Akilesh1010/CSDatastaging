*** Settings ***
Documentation    Portfolio Type Type data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Portfolio_Portfolio_Type.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Portfolio Type Type attribute1 figaro OLEDB
        Portfolio Type Type figaro OLEDB attribute validation



