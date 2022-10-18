*** Settings ***

Documentation    Instrument Price refinitiv data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/Instrument_Price_Refinitiv.robot


*** Test Cases ***
TC.01.Instrument Price refinitiv entity attributes validation
   Instrument Price entity refinitiv attributes validation


