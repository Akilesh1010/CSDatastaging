*** Settings ***
Documentation    Country MiFID Requirement data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/CountryMiFIDRequirement.robot
Resource  ../../resources/Figaro_db_connect.robot
Suite Setup  Connect to oledatabase
Suite Teardown       Disconnect to oledatabase

*** Test Cases ***
TC.01.Validate Country MiFID Requirement attributes figaro OLEDB
    Country MiFID Requirement figaro OLEDB attributes validation yay






