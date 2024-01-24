-- ex 1
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;

-- ex 2
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name FROM 2 FOR LENGTH(name)-1))) AS name
FROM Users
ORDER BY user_id;

-- ex 3
SELECT manufacturer, CONCAT('$', ROUND(SUM(total_sales)/1000000, 0), ' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;

-- ex 4
SELECT EXTRACT(MONTH from submit_date) AS mth, product_id AS product, ROUND(AVG(stars),2)
FROM reviews
GROUP BY EXTRACT(MONTH from submit_date), product_id
ORDER BY mth, product;

-- ex 5
SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE TO_CHAR(sent_date, 'mm-yyyy') = '08-2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

-- ex 6
SELECT tweet_id 
FROM Tweets
WHERE LENGTH(content) > 15;

-- ex 7
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-07-27' - INTERVAL 29 DAY AND '2019-07-27'
GROUP BY activity_date
HAVING COUNT(DISTINCT user_id) > 0;

-- ex 8
SELECT EXTRACT(MONTH FROM joining_date) AS month, COUNT(id) AS num_hired
FROM employees
WHERE EXTRACT(YEAR FROM joining_date) = 2022 AND EXTRACT(MONTH FROM joining_date) BETWEEN 1 AND 7
GROUP BY EXTRACT(MONTH FROM joining_date);

-- ex 9
SELECT POSITION('a' IN first_name) AS position
FROM worker
WHERE first_name = 'Amitah';

-- ex 10
SELECT title, CAST(SUBSTRING(title FROM LENGTH(winery)+2 FOR 4) AS int) AS year 
FROM winemag_p2
WHERE country = 'Macedonia';


