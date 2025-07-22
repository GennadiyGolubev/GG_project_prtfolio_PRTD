### What's the distribution of customers across segments A, B, C, D?
SELECT c11, count(distinct c1), (count(distinct c1) * 100.0 /(SELECT count(c1) from train))
as 'Supplier Percentage'
FROM train
where c11 != 'Segmentation'
group by c11;

### 2 Which Profession is most popular for each customer segment?
SELECT c6,c11, MAX(freq) as max_freq
FROM (
SELECT c11, c6, COUNT(*) AS freq
FROM train
GROUP BY c11, c6

)
GROUP BY c11
LIMIT 4;

### 3 What are the demographic characteristics of each segment?
SELECT c11 AS segment,
c2 AS demographic,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM train WHERE c11 = t.c11) AS percent,
avg(c9) as avg_fam_inc, avg(c4) as AVG_Age
FROM train t
GROUP BY c11, c2
ORDER BY c11,  percent DESC;

Additional the avg of segments seperatly:

SELECT c11 AS segment,
AVG(c9) as avg_fam_inc,
AVG(c4) as AVG_Age
FROM train
GROUP BY c11;

### 4 Which customer segment generates the highest average revenue per customer?
SELECT c8, c11, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM train WHERE c11 = t.c11) AS percent
FROM train t
Group by c11, c8
ORDER BY c11, percent desc;

Only the highest segments are here:

SELECT c8, c11, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM train WHERE c11 = t.c11) AS percent
FROM train t
Group by c11, c8
ORDER BY  percent desc
Limit 4 offset 1;

Only High segment percentage:

SELECT c11 AS segment,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM train WHERE c11 = t.c11) AS high_spender_percent
FROM train t
WHERE c8 = 'High'
GROUP BY c11
ORDER BY high_spender_percent DESC;

### 5 How does work experience correlate with spending behaviour across segments?
SELECT
c11 AS segment,
AVG(CASE
WHEN c8 = 'Low' THEN 1
WHEN c8 = 'Average' THEN 2
WHEN c8 = 'High' THEN 3
ELSE NULL
END) AS avg_spending_score,
AVG(c7) AS avg_work_experience
FROM train
GROUP BY c11
ORDER BY avg_spending_score DESC;

### 6 What's the relationship between education level and customer segmentation?
SELECT c11 AS Segment,
c5 AS Education,
COUNT(*) AS Count,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM train WHERE c11 = t.c11) AS Percent
FROM train t
--WHERE c5 IN ('Yes', 'No')
GROUP BY c11, c5
ORDER BY c11, Percent DESC;

### 7 Which demographic factors are strongest predictors of high-value segments?
SELECT c11 AS segment,
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM train WHERE c11 = t.c11) AS high_spender_percent
FROM train t
WHERE c8 = 'High'
GROUP BY c11
ORDER BY high_spender_percent DESC;

SELECT
CASE
WHEN c11 IN ('B', 'C') THEN 'High-Value'
ELSE 'Other'
END AS segment_type,
AVG(c4) AS avg_age,
AVG(c7) AS avg_family_size,
AVG(c9) AS avg_work_experience
FROM train
GROUP BY segment_type;

SELECT
c11 AS segment,
AVG(c4) AS avg_age,
AVG(c7) AS avg_fam_size,
AVG(c9) AS avg_work_exp

FROM train
GROUP BY c11;

### 8 What's the optimal customer profile for targeting in the new market?
SELECT
c11 AS segment,
AVG(c4) AS avg_age,
AVG(c7) AS avg_fam_size,
AVG(c9) AS avg_work_exp
FROM train
GROUP BY c11;

SELECT
c11 AS segment,
c2 AS gender,
c3 AS marital_status,
c5 AS education,
c6 AS profession,
COUNT(*) AS count
FROM train
WHERE c11 IN ('B', 'C')
GROUP BY c11, c2, c3, c5, c6
ORDER BY c11, count DESC;

### 9 How does marital status and family size impact spending patterns by segment?
select c3 as Merried, count(c3) as Count, AVG(CASE
WHEN c8 = 'Low' THEN 1
WHEN c8 = 'Average' THEN 2
WHEN c8 = 'High' THEN 3
ELSE NULL
END) AS Avg_spending_score,
avg(c9) as Avg_fam_Size,

group by c11, c3
order by c11, c3;

### 10 Which segments offer the best expansion opportunity based on customer characteristics?
SELECT
c11 AS segment,
COUNT(*) AS customer_count,
AVG(CASE
WHEN c8 = 'Low' THEN 1
WHEN c8 = 'Average' THEN 2
WHEN c8 = 'High' THEN 3
END) AS avg_spending_score,
100*(SUM(case when c2 = 'Male' then 1 else 0 end))/count(*) AS 'Percent of Males',
100*(sum(CASE WHEN c3 = 'Yes' THEN 1 ELSE 0 end))/count(*) as 'Percent of Married Customers',
avg(c4) AS avg_age
FROM train
GROUP BY c11
ORDER BY customer_count DESC;