*** Variables ***
${Figaro_JETS_exchangeRateService}       http://csl-jets01.csuat.com:8080/JETS-exchangerate/exchangeRateService?wsdl
${Figaro_JETS_exchangeRateService_XML}   C:/cs_datastaging/test_data/soapui/exchangeRateService.xml
${Gql_ExchangeRate_exchangeRateService}    query {exchangeRate(rateType:EXTEL,fromCurrencyCode:"USD",toCurrencyCode:"GBP"){rate rateType fromCurrencyCode toCurrencyCode}}


${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/