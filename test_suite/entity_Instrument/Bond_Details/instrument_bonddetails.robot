*** Settings ***

Documentation    Instrument Bond details data staging layer validation
Library             SeleniumLibrary
Resource    ../../../resources/instrumentBondDetail.robot


*** Test Cases ***
TC.01.Instrument Bond details entity attributes validation
    instrument bond details

