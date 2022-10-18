*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/AccountISAContributionSummary.robot

*** Test Cases ***

TC.01.Validate Account ISA Contribution Summary attributes Figaro JETS getClientDetails service
  Account ISA Contribution Summary from Figaro JETS Data Source Accounts Service Endpoint getClientAccountDetails service



