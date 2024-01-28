-- ex 1
SELECT 
SUM(CASE 
  WHEN device_type = 'laptop' THEN 1
  ELSE 0
END) AS laptop_views,
SUM(CASE 
  WHEN device_type IN ('tablet', 'phone') THEN 1
  ELSE 0
END) AS mobile_views
FROM viewership;

-- ex 2
SELECT x, y, z,
CASE
    WHEN (x+y) > z AND (x+z) > y AND (y+z) > x THEN 'Yes'
    ELSE 'No'
END triangle
FROM Triangle
  
-- ex 3
SELECT
ROUND(SUM(CASE 
  WHEN call_category IS NULL OR call_category = 'n/a' THEN 1 
  ELSE 0
END) * 100.0 / COUNT(case_id), 1)
FROM callers

-- ex 4
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;

-- ex 5
SELECT
CASE
    WHEN pclass = 1 THEN 'first_class'
    WHEN pclass = 2 THEN 'second_class'
    ELSE 'third_class'
END AS passenger_class,
SUM(CASE
    WHEN survived = 1 THEN 1
    ELSE 0
END) AS num_survivors,
SUM(CASE
    WHEN survived = 0 THEN 1
    ELSE 0
END) AS num_non_survivors,
FROM titanic
GROUP BY (CASE
    WHEN pclass = 1 THEN 'first_class'
    WHEN pclass = 2 THEN 'second_class'
    ELSE 'third_class'
END)
