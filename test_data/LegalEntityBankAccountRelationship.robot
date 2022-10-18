*** Variables ***

${Figaro_JETS_getClientDetails}    http://csl-jets02.csuat.com:8080/JETS-person/personService?wsdl
${Figaro_JETS_getClientDetails_XML}    C:/cs_datastaging/test_data/soapui/getClientDetails_LEBankAccountRealationship.xml
${Gql_LegalEntityBankAccountRelationship_getClientDetails}    query{person (priceRefreshOption:LIVE,valuationPriceBasis:BID where: {charlesStanleyID: {in:["AAAD6789"]}} ){nodes{legalEntityBankAccountRelationships{charlesStanleyID bankAccountKey accountOrAccountHolderName isModulusChecked }}}}


${Figaro_JETS_getIndividual}    http://csl-jets02.csuat.com:8080/JETS-ci/ciService?wsdl
${Figaro_JETS_getIndividual_XML}    C:/cs_datastaging/test_data/soapui/getIndividual_LEBankAccountRealtionship.xml
${Gql_LegalEntityBankAccountRelationship_getIndividual}    query {person (priceRefreshOption:LIVE,valuationPriceBasis:BID where: {charlesStanleyID: {in:["AAAB0491"]}} ){nodes { legalEntitySystemRelationships{systemLegalEntityID}}}}


${Figaro_RESTAPI_GET_individual_base_url}   http://figaroapicsl.charles-stanley.co.uk/latest
${Figaro_RESTAPI_rel_url}    /individual/00661018645
${Gql_legal_entity_RESTAPI_individual}  {person (priceRefreshOption:LIVE,valuationPriceBasis:BID where: {charlesStanleyID: {in:["AAAG0239"]}} ){nodes{legalEntityBankAccountRelationships{accountOrAccountHolderName isModulusChecked }}}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/