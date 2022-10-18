*** Settings ***
Documentation    Portfolio Investment Objective Type data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Portfolio_InvestmentObjective_Type.robot
Resource    ../../resources/Figaro_db_connect.robot
Suite Setup          Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Portfolio Investment Objective Type attribute1 figaro OLEDB
       Portfolio Investment Objective Type figaro OLEDB attribute1 validation
TC.02.Validate Portfolio Investment Objective Type attribute2 figaro OLEDB
      Portfolio Investment Objective Type figaro OLEDB attribute2 validation




