*** Settings ***
Documentation    Instrument Company GraphQL queries and JSON path

*** Variables ***
${GQL_companyId}=    query {instrument (priceRefreshOption: LIVE, first: 10,where: {sedol:{in:["B15KYH6"]}}){nodes{instrumentCompany{sedol companyId} }}}
${GQL_CompanyName}    query {instrument (priceRefreshOption: LIVE, first: 10, where: {sedol: { eq: "B15KYH6"}}) {nodes{instrumentCompany {sedol companyName}}}}
${GQL_companyInformation}    query {instrument (priceRefreshOption: LIVE, first: 10, where: {sedol: { eq: "B15KYH6"}}) {nodes{instrumentCompany {sedol companyInformation}}}}
${GQL_financiaInformation}    query {instrument (priceRefreshOption: LIVE, first: 10, where: {sedol: { eq: "B15KYH6"}}) {nodes{instrumentCompany {sedol financiaInformation}}}}
${GQL_marketCapitalisation}    query {instrument (priceRefreshOption: LIVE, first: 10, where: {sedol: { eq: "B15KYH6"}}) {nodes{instrumentCompany {sedol marketCapitalisation}}}}
${GQL_revenuePerShare}    query {instrument (priceRefreshOption: LIVE, first: 10, where: {sedol: { eq: "B15KYH6"}}) {nodes{instrumentCompany {sedol revenuePerShare}}}}
${GQL_returnOnEquity}    query {instrument (priceRefreshOption: LIVE, first: 10, where: {sedol: { eq: "B15KYH6"}}) {nodes{instrumentCompany {sedol returnOnEquity}}}}



##### JSON PATH ########
${JSON_PATH_sedol}    $.data.instrument.nodes[0:5].instrumentCompany.sedol
${JSON_PATH_companyId}    $.data.instrument.nodes[0:5].instrumentCompany.companyId
${JSON_PATH_CompanyName}    $.data.instrument.nodes[0].instrumentCompany.companyName
${JSON_PATH_companyInformation}    $.data.instrument.nodes[0].instrumentCompany.companyInformation
${JSON_PATH_financiaInformation}    $.data.instrument.nodes[0].instrumentCompany.financiaInformation
${JSON_PATH_marketCapitalisation}    $.data.instrument.nodes[0].instrumentCompany.marketCapitalisation
${JSON_PATH_revenuePerShare}    $.data.instrument.nodes[0].instrumentCompany.revenuePerShare
${JSON_PATH_returnOnEquity}    $.data.instrument.nodes[0].instrumentCompany.returnOnEquity
