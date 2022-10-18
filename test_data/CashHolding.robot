*** Variables ***
${Figaro_JETS_getAvailableCredit}    http://csl-jets01.csuat.com:8080/JETS-person/accountsService?wsdl
${Figaro_JETS_getAvailableCredit_XML}   C:/cs_datastaging/test_data/soapui/getAvailableCredit.xml
${Gql_CashHolding_getAvailableCredit}    query {account (priceRefreshOption: LIVE,valuationPriceBasis:BID,first:150,where:{accountNumber:{eq:"4432652"}}){nodes{accountCashHolding{availableToWithdraw availableToInvest }}}}

${Figaro_JETS_getClientDetails}    http://csl-jets02.csuat.com:8080/JETS-person/personService?wsdl
${Figaro_JETS_getClientDetails_XML}    C:/cs_datastaging/test_data/soapui/getClientDetails.xml
${Gql_CashHolding_getClientDetails}      query {account (priceRefreshOption: LIVE,valuationPriceBasis:BID,first:150,where:{accountNumber:{eq:"0101244"}}){nodes{accountCashHolding{cashHolding}}}}


#${Figaro_JETS_getPortfolioPositions}    http://csl-jets01.csuat.com:8080/JETS-portfolio/portfolioService?wsdl
#${Figaro_JETS_getPortfolioPositions_XML}  C:/cs_datastaging/test_data/soapui/getPortfolioPositions.xml
#${Gql_CashHolding_getPortfolioPositions}  query {account (priceRefreshOption: LIVE,valuationPriceBasis:BID,first:150,where:{accountNumber:{eq:"4432652"}}){nodes{accountCashHolding{availableToWithdraw availableToInvest  cashHolding}}}}


${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/