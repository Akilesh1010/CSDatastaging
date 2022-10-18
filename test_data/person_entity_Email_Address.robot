*** Variables ***
${Figaro_JETS_getIndividual}    http://csl-jets01.csuat.com:8080/JETS-ci/ciService?wsdl
${Figaro_JETS_getIndividual_XML}    C:/cs_datastaging/test_data/soapui/getIndividual.xml
${Gql_person_entity_getIndividual}     query{person(priceRefreshOption:LIVE, valuationPriceBasis:BID, charlesStanleyId:"AAAD6789"){nodes{ emailAddresses{email} }}}

${Grapghql_base_url}   http://datastaging1-uat.charles-stanley.co.uk/graphql/