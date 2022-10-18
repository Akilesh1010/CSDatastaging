*** Variables ***
${Figaro_JETS_listOrdersByDate}    http://csl-jets01:8080/JETS-order/orderService?wsdl
${Figaro_JETS_listOrdersByDate_XML}    C:/cs_datastaging/test_data/soapui/listOrdersByDate.xml
${Gql_Order_listOrdersByDate}    query{account(valuationPriceBasis:MID,priceRefreshOption:LIVE,first:10,where:{accountNumber:{eq:"0204276"}}){totalCount nodes{accountNumber accountOrders{direction type quantity currency price  limitPrice consideration commission otherCosts netValue}}}}




${Grapghql_base_url}    http://datastaging1-uat.charles-stanley.co.uk/graphql/