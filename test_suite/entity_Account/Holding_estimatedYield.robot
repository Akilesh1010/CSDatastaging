*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Holding_estimatedYield.robot

*** Test Cases ***

TC.01.Validate Holding Estimated Yield attributes Figaro JETS getClientDetails service
  Holding Estimated Yield from Figaro JETS Data Source Portfolio Services end point getClientPortfolio service
