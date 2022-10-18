*** Variables ***

${Figaro_JETS_getClientDetails}    http://csl-jets02.csuat.com:8080/JETS-person/personService?wsdl
${Figaro_JETS_getClientDetails_XML}    C:/cs_datastaging/test_data/soapui/getClientDetails_AccountBankAccountRelationship.xml
${Gql_AccountBankAccountRelationship_getClientDetails}    query{account(priceRefreshOption:LIVE,valuationPriceBasis:BID where:{accountNumber:{in:["0100021"]}}){nodes{legalEntityAccountRelationships{charlesStanleyID}accountBankAccountRelationships{accountNumber bankAccountKey accountOrAccountHolderName isModulusChecked paymentSystemTypeCode paymentSystemCode isDefaultBankAccount}}}}


${Figaro_RESTAPI_Default_base_url}   http://figaroapicsl.charles-stanley.co.uk/latest
${Figaro_RESTAPI_rel_url}    /account/4431762/defaultbankaccount
${Gql_account_RESTAPI_Default}  query {account(priceRefreshOption:LIVE,valuationPriceBasis:BID where:{accountNumber:{in:["4431762"]}}){nodes{legalEntityAccountRelationships{charlesStanleyID}accountBankAccountRelationships{accountNumber bankAccountKey accountOrAccountHolderName isModulusChecked paymentSystemTypeCode paymentSystemCode isDefaultBankAccount}}}}


${Figaro_RESTAPI_Payment_base_url}   http://figaroapicsl.charles-stanley.co.uk/latest
${Figaro_RESTAPI_Payment_rel_url}    /account/0100050/accountpaymentdetails
${Gql_account_RESTAPI_Payment}  query {account(priceRefreshOption:LIVE,valuationPriceBasis:BID where:{accountNumber:{in:["0100050"]}}){nodes{legalEntityAccountRelationships{charlesStanleyID}accountBankAccountRelationships{accountNumber bankAccountKey accountOrAccountHolderName isModulusChecked paymentSystemTypeCode paymentSystemCode isDefaultBankAccount}}}}

${Grapghql_base_url}   http://datastaging1-uat.charles-stanley.co.uk/graphql/