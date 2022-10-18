*** Settings ***
Documentation    Account data staging layer validation
Library             SeleniumLibrary
Resource    ../../resources/Order1.robot

*** Test Cases ***


TC.01.Validate Order attributes Figaro JETS listOrdersByDate service.
   Order1 from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.

TC.02.Validate Order divide attributes Figaro JETS listOrdersByDate service.
   Order1 divide attributes from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.

TC.03.Validate Order divide attributes Figaro JETS listOrdersByDate service.
   Order1 price attributes from Figaro JETS Data Source Order Service Endpoint listOrdersByDate service.








