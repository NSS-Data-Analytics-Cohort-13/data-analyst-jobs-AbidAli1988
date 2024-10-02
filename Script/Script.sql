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

-- Answer: 27
