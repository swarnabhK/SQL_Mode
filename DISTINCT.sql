-- Write a query that returns the unique values in the year column, in chronological order.
-- Query

SELECT DISTINCT year from tutorial.aapl_historical_stock_price ORDER BY year;


-- Write a query that counts the number of unique values in the month column for each year.

SELECT year,COUNT(DISTINCT month) as unique_months from tutorial.aapl_historical_stock_price GROUP BY year ORDER BY year;


-- Write a query that separately counts the number of unique values in the month column and the number of unique values in the `year` column.

SELECT COUNT(DISTINCT year) as distinct_years,COUNT(DISTINCT month) as unique_months from tutorial.aapl_historical_stock_price;