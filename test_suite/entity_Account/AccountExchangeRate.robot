*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/AccountExchangeRate.robot

*** Test Cases ***

TC.01.Validate Account Exhange Rate attributes Figaro JET getPortfolioPositions service
  AccountExchangeRate from Figaro JETS Data Source Portfolio Service Endpoint getPortfolioPositions service


