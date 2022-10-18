*** Settings ***
Documentation    Instrument Broker rating  data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/instrument_broker_rating1.robot


*** Test Cases ***
TC.01.Broker rating entity attributes validation
    Broker rating service
