*** Settings ***
Documentation    Portfolio Service Level Type data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Portfolio_ServiceLevel_Type.robot.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Portfolio Service Level Type attribute1 figaro OLEDB
       Portfolio Service Level Type figaro OLEDB attribute validation



