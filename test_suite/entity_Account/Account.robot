*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Account.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***

TC.01.Validate Account attributes Figaro JETS getClientDetails service
    Account from Figaro JETS Data Source Person Service Endpoint getClientDetails service
TC.02.Validate Account isPPSAccount attribute Figaro JETS getClientDetails service
    Account isPPSAccount from Figaro JETS Data Source Person Service Endpoint getClientDetails service
TC.03.Validate Account attributes Figaro OLEDB
     Account Entity figaro OLEDB attributes validation
#TC.04.Validate Account Service Type attributes Figaro JETS getClientDetails service
    #Account Service Type from Figaro JETS Data Source Person Service Endpoint getClientDetails service
TC.05.Validate Account Tax cost attributes Figaro JETS getClientPortfolio service
     Account Tax cost from Figaro JETS Data Source Portfolio Services end point getClientPortfolio service








