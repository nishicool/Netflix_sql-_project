
CREATE TABLE netflix (
show_id VARCHAR(6),
type VARCHAR(10),
title VARCHAR(150),
director VARCHAR(210),
casts VARCHAR(900),
country	VARCHAR(160),
date_added VARCHAR(50),
release_year INT,
rating VARCHAR(10),
duration VARCHAR(15),
listed_in VARCHAR(100),
description VARCHAR(250)
);

SELECT * 
FROM netflix;

SELECT 
COUNT(*) AS total_content
FROM netflix;

SELECT *
FROM netflix;

SELECT 
DISTINCT TYPE
FROM netflix;

SELECT *
FROM NETFLIX

15 business problems

1. Count the no. of movies vs tv shows
SELECT 
type,
COUNT(*) AS  total_content
FROM netflix
GROUP BY type

2.Find the most commom rating for movies and tv shows
SELECT
type,
rating
FROM
(
SELECT 
type,
rating,
COUNT(*),
RANK () OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
FROM netflix
GROUP BY 1,2
) AS t1
WHERE
ranking=1

3.List all movies realsed in a specific year (e.g,2020)

SELECT type , title,release_year
FROM netflix
WHERE type = 'Movie'
AND
release_year = 2020

4. find the top 5 countries with the most content on netflix
SELECT 
UNNEST(STRING_TO_ARRAY(country,',')) as new_country,
COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

5.Identify the longest movie

SELECT *
FROM netflix
WHERE 
type = 'Movie'
AND
duration =(SELECT MAX(duration) FROM netflix);

6.Find the content addded in the last 5 years

SELECT *
FROM netflix
WHERE TO_DATE(date_added, 'MONTH DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years'

7.Find all the movies tv shows by director "rajiv chilaka"

SELECT type , director , title
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%';

8.Count the number of content items in each genre

SELECT 
UNNEST (STRING_TO_ARRAY(listed_in,',')) AS genre,
COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1

10.List all the movies that are documentaries

SELECT *
FROM netflix
WHERE listed_in ILIKE'%documentaries%'








