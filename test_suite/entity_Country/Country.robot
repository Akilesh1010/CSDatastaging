*** Settings ***
Documentation    Country data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Country.robot


*** Test Cases ***
TC.01.Country entity attributes validation
    Country from Figaro JETS Data Source Market Service Endpoint getCountryList service
