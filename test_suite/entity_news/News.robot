*** Settings ***

Documentation    Price data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/News.robot


*** Test Cases ***
TC.01.Instrument Price refinitiv entity attributes validation
   Instrument Price entity refinitiv attributes validation
