-- Calculate the total number of shares traded each month. 
-- Order your results chronologically.

-- Query

SELECT year,month,SUM(volume) from tutorial.aapl_historical_stock_price 
GROUP BY year,month ORDER BY year ,month ;


-- Write a query to calculate the average daily price change in Apple stock, grouped by year.
-- Query
SELECT year,AVG(close-open) as avg_daily_change
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year


-- Write a query that calculates the lowest and highest prices that Apple stock achieved each month.
-- Query

SELECT year, month, MIN(low) as lowest_price,MAX(high) as highest_price
FROM tutorial.aapl_historical_stock_price
GROUP BY year,month
ORDER BY year,month



