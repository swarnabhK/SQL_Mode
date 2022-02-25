-- Practice SQL queries for aggregate functions.


-- Write a query that determines counts of every single column of Apple stock prices table. 
-- Which column has the most null values?

-- Query)

SELECT count(date) as c_dates, count(year) as c_year, count(month) as c_month, count(open) as c_open, count(high) as c_high, 
count(low) as c_low, count(close) as c_close, count(volume) as c_volume FROM tutorial.aapl_historical_stock_price;


-- Write a query to calculate the average opening price

-- Query)

SELECT SUM(open)/Count(open) as avg_open_price FROM tutorial.aapl_historical_stock_price


-- What was Apple's lowest stock price (at the time of this data collection)?

-- Query)

SELECT MIN(low) as lowest_stock_price from tutorial.aapl_historical_stock_price;

-- What was the highest single-day increase in Apple's share value?

-- Query)

SELECT MAX(close-open) as highest_single_day_price_rise from tutorial.aapl_historical_stock_price;


-- Write a query that calculates the average daily trade volume for Apple stock
-- Query)

SELECT AVG(VOLUME) from tutorial.aapl_historical_stock_price;