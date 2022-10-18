*** Settings ***
Documentation    Instrument Price data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/Instrument_Price.robot


*** Test Cases ***

TC.01.Validate Instrument Price attributes Figaro JETS fetchInstrument service
    Instrument Price from Figaro JETS Data Source Instrument Service Endpoint fetchInstrument service

TC.02.Validate Instrument Price attributes divided attributes Figaro JETS fetchInstrument service
    Instrument Price attributes divided from Figaro JETS Data Source Instrument Service Endpoint fetchInstrument service



