*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Holding.robot

*** Test Cases ***

TC.01.Validate Holding attributes Figaro JETS getClientDetails service
   Holding from Figaro JETS Data Source Portfolio Services end point getClientPortfolio service


