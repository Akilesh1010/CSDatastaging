*** Variables ***
${Figaro_JETS_getClientPortfolio}    http://csl-jets01.csuat.com:8080/JETS-portfolio/portfolioService?wsdl
${Figaro_JETS_getClientPortfolio_XML}    C:/cs_datastaging/test_data/soapui/getClientPortfolio.xml
${Gql_Holding_getClientPortfolio}     query {account(priceRefreshOption:DELAYED,valuationPriceBasis:BID where: {accountNumber:{ eq:"0101244"}}){nodes{accountHoldings{accountNumber sedol depotCode valuationCurrency quantity taxCost  percentageChangeInValue income }}}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/