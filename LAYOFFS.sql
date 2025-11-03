create database layoff_database;
use layoff_database;
CREATE TABLE layoffs (
    company VARCHAR(100),
    location VARCHAR(50),
    industry VARCHAR(100),
    total_laid_off INT,
    percentage_laid_off int,
    layoff_date VARCHAR(30),
    stage VARCHAR(50),
    country VARCHAR(50),
    funds_raised_millions INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 lines;

DESCRIBE LAYOFFS;

ALTER TABLE LAYOFFS MODIFY COLUMN percentage_laid_off DECIMAL(5,2)NULL;

SELECT * FROM LAYOFFS;

-- Show all rows (limit 100)
SELECT * FROM layoffs LIMIT 100;

--  total records
SELECT COUNT(*) AS total_records FROM layoffs;

-- Count layoffs by company
SELECT company, COUNT(*) AS layoffs FROM layoffs 
GROUP BY company 
ORDER BY layoffs
DESC LIMIT 50;

-- Layoffs per month (time-series)
SELECT layoff_date , COUNT(*) AS layoffs
 FROM layoffs
 GROUP BY Layoff_date 
 ORDER BY layoff_date;
 
-- Companies with largest COUNT of employees affected (if affected column exists)
SELECT company, count(`country`) AS total_affected FROM layoffs 
GROUP BY COMPANY
 ORDER BY total_affected 
 DESC LIMIT 50;
 
 -- Layoffs by industry
SELECT industry, COUNT(*) AS layoffs 
FROM layoffs
 GROUP BY INDUSTRY
 ORDER BY layoffs DESC;
 
 -- Companies that had layoffs more than once
SELECT company, COUNT(*) AS events 
FROM layoffs GROUP BY COMPANY
 HAVING events > 1
ORDER BY events DESC;



 
 

