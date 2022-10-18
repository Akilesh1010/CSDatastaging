*** Settings ***

Documentation    Instrument Trade Condition2 data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/instrumentTradeCondition2.robot


*** Test Cases ***
TC.01.Instrument Trade Condition2 entity attributes validation
   instrument Trade Condition2

