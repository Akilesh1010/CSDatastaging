*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/CashHolding.robot

*** Test Cases ***

TC.01.Validate Cash Holding attributes Figaro JETS getAvailableCredit service
   Cash Holding from Figaro JETS Data Source Accounts Service End Point getAvailableCredit service

TC.02.Validate Cash Holding attributes Figaro JETS getClientDetails service
  Cash Holding from Figaro JETS Data Source Person Service End Point getClientDetails service

#TC.03.Validate Cash Holding attributes Figaro JETS getPortfolioPositions service
 # Cash Holding from Figaro JETS Data Source Portfolio Service End Point getPortfolioPositions service
