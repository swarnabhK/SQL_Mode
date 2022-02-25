-- Practice) Write a query that determines counts of every single column of Apple stock prices table. 
-- Which column has the most null values?

-- Query)

SELECT count(date) as c_dates, count(year) as c_year, count(month) as c_month, count(open) as c_open, count(high) as c_high, 
count(low) as c_low, count(close) as c_close, count(volume) as c_volume FROM tutorial.aapl_historical_stock_price; 