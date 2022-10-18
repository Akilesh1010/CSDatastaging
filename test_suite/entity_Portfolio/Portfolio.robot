*** Settings ***
Documentation    Portfolio data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Portfolio.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase


*** Test Cases ***

TC.01.Validate Portfolio attributes Figaro JETS getClientDetails service
     Portfolio from Figaro JETS Data Source Person Service End Point getClientDetails service

TC.02.Validate Portfolio attributes Figaro RESTAPI GETportfolio
   Portfolio figaro RESTAPI GETportfolio

TC.03.Validate Portfolio attributes OLEDB
   Portfolio Entity figaro OLEDB attributes validation

