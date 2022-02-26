-- Write a query that selects the school name, player name, position, and weight for 
-- every player in Georgia, ordered by weight (heaviest to lightest). Be sure to make an alias 
-- for the table, and to reference all column names in relation to the alias.

-- Query

SELECT p.player_name, t.school_name,t.conference FROM benn.college_football_players p JOIN benn.college_football_teams t
on p.school_name = t.school_name WHERE t.division='FBS (Division I-A Teams)';

-- Write a query that performs an inner join between the tutorial.crunchbase_acquisitions table and the tutorial.crunchbase_companies table, but instead of listing individual rows, count the number of non-null rows in each table
-- Query

SELECT COUNT(companies.permalink) AS companies_permalink_c,
       COUNT(companies.name) AS companies_name_c,
       COUNT(acquisitions.company_permalink) AS acquisitions_permalink_c,
       COUNT(acquisitions.acquired_at) AS acquired_date_c
  FROM tutorial.crunchbase_companies companies
  JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink


-- Modify the query above to be a LEFT JOIN. Note the difference in results.(More rows in the table left of join)

SELECT COUNT(companies.permalink) AS companies_permalink_c,
       COUNT(companies.name) AS companies_name_c,
       COUNT(acquisitions.company_permalink) AS acquisitions_permalink_c,
       COUNT(acquisitions.acquired_at) AS acquired_date_c
  FROM tutorial.crunchbase_companies companies
 LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink


-- Count the number of unique companies (don't double-count companies) and unique acquired companies by state. Do not include results for which there is no state data, and order by the number of acquired companies from highest to lowest.
-- Query 

SELECT COUNT(DISTINCT companies.permalink) AS companies_permalink_c,
       COUNT(DISTINCT acquisitions.company_permalink) AS acquisitions_permalink_c,companies.state_code
  FROM tutorial.crunchbase_companies companies
 LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
   WHERE companies.state_code IS NOT NULL GROUP BY companies.state_code ORDER BY 3



-- Write a query that shows a company's name, "status" (found in the Companies table), and the number of unique investors in that company. Order by the number of investors from most to fewest. Limit to only companies in the state of New York.

-- Query

SELECT c.name,c.status,COUNT(DISTINCT i.investor_name) from tutorial.crunchbase_companies c LEFT JOIN
tutorial.crunchbase_investments i ON c.permalink = i.company_permalink WHERE c.state_code='NY' GROUP BY c.name,c.status ORDER BY 3 DESC;


-- UNIONS

-- Write a query that appends the two crunchbase_investments datasets above (including duplicate values). Filter the first dataset to only companies with names that start with the letter "T", and filter the second to companies with names starting with "M" (both not case-sensitive). Only include the company_permalink, company_name, and investor_name columns.

-- Query

SELECT company_name,company_permalink,investor_name
  FROM tutorial.crunchbase_investments_part1
  WHERE company_name like 'T%'

 UNION ALL

 SELECT company_name,company_permalink,investor_name
  FROM tutorial.crunchbase_investments_part2
  WHERE company_name like 'M%'
