*** Settings ***
Documentation    Instrument Comapany csmarketdata sql queries

*** Variables ***
${CompanyID}        SELECT SEDOL,CompanyID FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6'
${Company Name}     SELECT SEDOL,CompanyName FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6'
${Company Information}  SELECT SEDOL,CompanyInfo FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6'
${Financial Information}    SELECT SEDOL,FinancialInfo FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6'
${Market Capitalisation}    SELECT SEDOL,MarketCap FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6'
${Revenue Per Shar}     SELECT SEDOL,cast(RevPerShare as decimal(18,2)) FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6'
${Return on Equity}     SELECT SEDOL, cast(RetOnEquity as decimal(18,2)) FROM CSMarketData.TRKD.ReutersData WHERE SEDOL = 'B15KYH6';

