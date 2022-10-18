*** Variables ***
${Figaro_JETS_getClientDetails}    http://csl-jets02.csuat.com:8080/JETS-person/personService?wsdl
${Figaro_JETS_getClientDetails_XML}   C:/cs_datastaging/test_data/soapui/getClientDetails.xml
${Gql_Account_getClientDetails}    query {account(priceRefreshOption:LIVE,valuationPriceBasis:BID,first: 150,where:{accountNumber:{eq:"0100021"}}){nodes{portfolioCode name accountNumber status productCode settlementCurrency serviceType isPPSAccount}}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/


${Figaro_JETS_getClientPortfolio}    http://csl-jets01.csuat.com:8080/JETS-portfolio/portfolioService?wsdl
${Figaro_JETS_getClientPortfolio_XML}    C:/cs_datastaging/test_data/soapui/getClientPortfolio.xml
${Gql_Account_getClientPortfolio}     query {account(priceRefreshOption:LIVE,valuationPriceBasis:BID,first: 150,where:{accountNumber:{eq:"0100021"}}){nodes{ taxCost  }}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/