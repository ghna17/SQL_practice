-- ex 1
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;

-- ex 2
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS difference
FROM STATION;

-- ex 3
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;

-- ex 4
SELECT ROUND((CAST (SUM(item_count*order_occurrences) AS decimal)/SUM(order_occurrences)), 1) AS mean
FROM items_per_order;

-- ex 5
SELECT candidate_id
FROM candidates
WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

-- ex 6
SELECT user_id, DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between 
FROM posts
WHERE post_date BETWEEN '2021-01-01' AND '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id) >= 2;

-- ex 7
SELECT card_name, MAX(issued_amount) -  MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

-- ex 8
SELECT manufacturer, COUNT(drug), (ABS(SUM(total_sales - cogs))) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;

-- ex 9
SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description NOT LIKE '%boring%'
ORDER BY rating DESC;

-- ex 10
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- ex 11
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- ex 12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

