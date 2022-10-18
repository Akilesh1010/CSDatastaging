*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Order.robot

*** Test Cases ***

TC.01.Validate Order attributes Figaro JETS listOrdersByDate service.
   Order from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.


