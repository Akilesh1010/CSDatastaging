import requests
import json
import pandas as pd


query = """ query {instrument (priceRefreshOption: LIVE, 

first: 10,
where: {sedol: { eq: "B15KYH6"}}


)

{
  nodes{
 

instrumentCompany{
  sedol
  instrumentCompanyBalanceSheets {
  companyId  
  financialYearEnding
  totalNonCurrentAssets
  totalCurrentAssets
  totalAssets
  totalLiabilities
  totalNetAssets
  shareholdersFunds
  minorityInterest
  totalEquity
  updateType
  
}
}  
 

}
}
}"""

url = 'http://datastaging1-sit.charles-stanley.co.uk/graphql/'
r = requests.post(url, json={'query': query})
print(r.status_code)
print(r.text)
json_data = json.loads(r.text)

df_data = json_data
df = pd.DataFrame(df_data)['data']
print(df)