-- Write a query that includes a column that is flagged "yes" when a player is from California,
-- and sort the results with those players first.

-- Query

SELECT player_name, state, 
CASE 
  WHEN state = 'CA' THEN 'Yes'
  ELSE 'No'
END as is_from_california from benn.college_football_players ORDER BY is_from_california DESC;


-- Write a query that includes players' names and a column that classifies them into four categories based on height
-- Query

SELECT player_name, height,
CASE 
  WHEN height >40 AND height<=50 THEN '41-50'
  WHEN height >50 AND height<=60 THEN '51-60'
  WHEN height >60 AND height<=70 THEN '61-70'
  ELSE 'Above 70'
END as height_group from benn.college_football_players;


-- For above query count the number of players in each height group
-- Query

SELECT
CASE 
  WHEN height >50 AND height<=60 THEN '51-60'
  WHEN height >60 AND height<=70 THEN '61-70'
  WHEN height >70 AND height<=80 THEN '71-80'
  ELSE 'Above 80'
END as height_group, COUNT(*) from benn.college_football_players GROUP BY height_group;


-- Write a query that selects all columns from benn.college_football_players 
-- and adds an additional column that displays the player's name if that player is a junior or senior.
-- Query

SELECT *,
CASE WHEN year in ('JR','SR')
THEN player_name ELSE null END as upperclass_playername FROM benn.college_football_players


-- Write a query that counts the number of 300lb+ players for each of the following regions: West Coast (CA, OR, WA), Texas, and Other (everywhere -- else).
-- Query

SELECT
CASE 
  WHEN state in ('CA','OR','WA') THEN 'West Coast'
  WHEN state = 'TX' THEN 'Texas'
  ELSE 'Other'
END as region,COUNT(*) FROM benn.college_football_players WHERE weight>=300 GROUP BY region ;


-- Write a query that calculates the combined weight of all underclass players (FR/SO) in California as well as the combined weight of all 
-- upperclass players (JR/SR) in California.

SELECT
CASE 
  WHEN year in ('JR','SR') THEN 'Underclass'
  WHEN year in ('FR','SO') THEN 'Upperclass'
  ELSE 'Other'
END as class_type,SUM(weight) as weight_combined FROM benn.college_football_players  GROUP BY class_type;

-- Pivoting example(showing data horizontally)
-- Query

SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count
FROM benn.college_football_players

-- Write a query that displays the number of players in each state, with FR, SO, JR, and SR players in separate columns and another column for the total number of players. Order results such that states with the most players come first. 

-- Query

SELECT state,
COUNT(CASE WHEN year='FR' THEN 1 ELSE NULL END) AS fr_count,
COUNT(CASE WHEN year='SO' THEN 1 ELSE NULL END) AS so_count,
COUNT(CASE WHEN year='JR' THEN 1 ELSE NULL END) AS jr_count,
COUNT(CASE WHEN year='SR' THEN 1 ELSE NULL END) AS sr_count,
COUNT(1) as total_players
FROM benn.college_football_players
GROUP BY state ORDER BY total_players DESC


-- Write a query that shows the number of players at schools with names that start with A through M, and the number at schools with names starting with N - Z.

-- Query

SELECT COUNT(*),
CASE 
  WHEN school_name  <'n' THEN 'A-M'
  WHEN school_name >= 'n' THEN 'N-Z'
ELSE 'Other' END AS name_starting_with FROM benn.college_football_players GROUP BY name_starting_with ORDER BY name_starting_with;


  

