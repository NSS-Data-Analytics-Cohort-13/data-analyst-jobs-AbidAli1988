--1.	How many rows are in the data_analyst_jobs table?

SELECT count(*)
FROM indeed_data_analysts

-- Answer: 1793

--2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT company
FROM indeed_data_analysts
LIMIT 10

--  Answer: ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT count(location) as posting_tennessee_Kentucky
FROM indeed_data_analysts
WHERE location in ('TN','KY');

SELECT 	count (location) as posting_tennessee_Kentucky
FROM indeed_data_analysts
WHERE location = 'TN' OR location ='KY'


-- Answer: 27

--4 How many postings in Tennessee have a star rating above 4?

SELECT count(star_rating) as Tennessee_star_rating, location 
FROM indeed_data_analysts
WHERE location='TN' and star_rating >4
GROUP BY location

SELECT *
FROM indeed_data_analysts
WHERE location ='TN'
AND star_rating >4

-- Answer: 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?

SELECT count(*)
FROM indeed_data_analysts
where review_count BETWEEN 500 and 1000

-- Answer: 151

-- 6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT AVG(star_rating) as avg_rating, location as state
FROM  indeed_data_analysts
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC
LIMIT 1;

--Answer: NE

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT count(DISTINCT title) AS unique_job_titles
FROM indeed_data_analysts

--Answer: 881

-- 8. How many unique job titles are there for California companies?

SELECT count(DISTINCT title) AS unique_jobs_california
FROM indeed_data_analysts
WHERE location ='CA'

-- Answer: 230

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) AS avg_rating
FROM indeed_data_analysts
WHERE review_count IS NOT NULL
AND company IS NOT NULL
GROUP BY company
HAVING min(review_count)>5000
ORDER BY avg_rating DESC , company 
LIMIT 1



--Answer: 40

-- 10 Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

--Answer: 4.1999998090000000

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT DISTINCT title AS job_title
FROM indeed_data_analysts
WHERE title iLIKE '%Analyst%'

--Answer: 774

--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title AS job_title
FROM indeed_data_analysts
WHERE title not  ilike '%Analyst%'
And title not ilike '%Analytics%'

--Answer: tableau 


