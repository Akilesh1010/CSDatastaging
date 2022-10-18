*** Variables ***
${Figaro_JETS_fetchInstrument}    http://csu-jets01.csuat.com:8080/JETS-instrument/instrumentService?wsdl
${Figaro_JETS_fetchInstrument_XML}   C:/cs_datastaging/test_data/soapui/fetchInstrument.xml
${Gql_InstrumentPrice_fetchInstrument}    query{instrument(priceRefreshOption: LIVE where: {sedol:{in:["0007272"]}}){totalCount nodes{sedol ric instrumentPrice{dateTime midPrice bidPrice askingPrice unitPrice currency}}}}


${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/