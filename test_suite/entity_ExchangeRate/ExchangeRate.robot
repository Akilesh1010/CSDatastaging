*** Settings ***
Documentation    Exchange Rate data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/ExchangeRate.robot

*** Test Cases ***

TC.01.Validate Exchange Rate attributes Figaro JETS getExchangeRateTable service
  ExchangeRate from Figaro JETS Data Source Exchange Rate End Point getExchangeRateTable service

TC.02.Validate Exchange Rate--fromcurrencycode attributes Figaro JETS getExchangeRateTable service
  ExchangeRate-fromcurrencycode from Figaro JETS Data Source Exchange Rate End Point getExchangeRateTable service

TC.03.Validate Exchange Rate-tocurrencycode attributes Figaro JETS getExchangeRateTable service
  ExchangeRate-tocurrencycode from Figaro JETS Data Source Exchange Rate End Point getExchangeRateTable service


