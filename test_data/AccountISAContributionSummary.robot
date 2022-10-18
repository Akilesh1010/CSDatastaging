*** Variables ***
${Figaro_JETS_getClientAccountDetails}    http://csl-jets01.csuat.com:8080/JETS-person/accountsService?wsdl
${Figaro_JETS_getClientAccountDetails_XML}   C:/cs_datastaging/test_data/soapui/getClientAccountDetails.xml
${Gql_AccountISAContributionSummary_getClientAccountDetails}    query {account(priceRefreshOption:LIVE,valuationPriceBasis:BID,first:150,where:{accountNumber:{eq:"4810516"}}){nodes{accountISAContributionSummaries{ currentTaxYear allowanceLimit remainingAllowance totalSubscriptions totalWithdrawals taxYear}}}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/