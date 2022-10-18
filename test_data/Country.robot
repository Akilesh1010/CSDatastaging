*** Variables ***
${Figaro_JETS_getCountryList}    http://csl-jets01:8080/JETS-market/marketService?wsdl
${Figaro_JETS_getCountryList_XML}   C:/cs_datastaging/test_data/soapui/getCountryList.xml
${Gql_Country_getCountryList}    query {person(priceRefreshOption: LIVE,valuationPriceBasis:BID where:{countryOfBirthNavigation:{iso3CountryCode: {eq: "AUS"}}}){nodes{ countryOfBirthNavigation{iso2CountryCode iso3CountryCode countryName}}}}



${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/