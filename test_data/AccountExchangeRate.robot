*** Variables ***
${Figaro_JETS_getPortfolioPositions}    http://csl-jets01.csuat.com:8080/JETS-portfolio/portfolioService?wsdl
${Figaro_JETS_getPortfolioPositions_XML}   C:/cs_datastaging/test_data/soapui/getPortfolioPositions.xml
${Gql_AccountExchangeRate_getPortfolioPositions}    query {account (priceRefreshOption: LIVE,valuationPriceBasis:BID,first:150,where:{accountNumber:{eq:"0100217"}}){nodes{legalEntityAccountRelationships {charlesStanleyID}accountExchangeRates{currency}}}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/