*** Variables ***

${Figaro_JETS_getClientDetails}    http://csl-jets02.csuat.com:8080/JETS-person/personService?wsdl
${Figaro_JETS_getClientDetails_XML}   C:/cs_datastaging/test_data/soapui/getClientDetailsPortfolio.xml
${Gql_Portfolio_getClientDetails}    query {account(priceRefreshOption: LIVE,valuationPriceBasis:BID, first: 150, where: {accountNumber: {eq: "0100018"}}){nodes{accountNumber portfolioCodeNavigation{portfolioCode description valuationCurrency serviceLevelCode investmentObjectiveCode typeCode}}}}


${Figaro_RESTAPI_GETportfolio_base_url}   http://figaroapicsl.charles-stanley.co.uk/latest
${Figaro_RESTAPI_rel_url}    /portfolio/BMID011PY
${Gql_portfolio_RESTAPI_GETportfolio}  query {account(priceRefreshOption: LIVE,valuationPriceBasis:BID, first: 150, where: {accountNumber: {eq: "0100018"}}){nodes{accountNumber portfolioCodeNavigation{serviceLevelCode investmentObjectiveCode typeCode}}}}


${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/