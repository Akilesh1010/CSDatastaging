*** Settings ***
Documentation    Graphql

Library     RequestsLibrary
Library     collections
Library     JSONLibrary
Resource

*** Variables ***
${base_url}    http://datastaging1-sit.charles-stanley.co.uk
{instrument (priceRefreshOption: LIVE, first: 10,where: {sedol: { eq: "B15KYH6"}}){nodes{instrumentCompany{sedolinstrumentCompanyBalanceSheets {companyId  financialYearEnding}}}}}"""


*** Test Cases ***
Access graphQL through robot framework
    create session  rootURL     ${base_url}
    ${body}=     create dictionary  query= {instrument (priceRefreshOption: LIVE, first: 10,where: {sedol: { eq: "B15KYH6"}}){nodes{instrumentCompany{sedolinstrumentCompanyBalanceSheets {companyId}}}}}
    ${header}=   create dictionary   Content-Type= application/json
    ${resp}=     post request   rootURL  data= ${body}
    ${headers}=     ${header}  Should Be Equal As Strings  ${resp.status_code}  200
    ${jsonval}   set variable    {resp.json()}
    ${value}=      Set Variable  ${jsonval['instrumentCompanyBalanceSheets'][1]['companyId']}
    log to console Console log response value   ${jsonval}

