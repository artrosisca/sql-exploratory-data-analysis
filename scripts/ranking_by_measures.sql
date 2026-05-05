--Ranking By Measures

--5 products that generate the highest revenue
SELECT TOP 5 
dp.product_name,
SUM(fc.sales_amount) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_products AS dp --dimension
ON dp.product_key = fc.product_key
GROUP BY dp.product_name
ORDER BY total_revenue DESC

--using window functions(view)
SELECT *
FROM (
	SELECT 
	dp.product_name,
	SUM(fc.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(fc.sales_amount) DESC) AS rank_products --numerar a row over total_revenue
	FROM gold.fact_sales AS fc
	LEFT JOIN gold.dim_products AS dp 
	ON dp.product_key = fc.product_key
	GROUP BY dp.product_name
	) AS sub
WHERE rank_products <= 5

--5 worst perfoming products
SELECT TOP 5 
dp.product_name,
SUM(fc.sales_amount) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_products AS dp --dimension
ON dp.product_key = fc.product_key
GROUP BY dp.product_name
ORDER BY total_revenue ASC

--5 categories that generate the highest revenue
SELECT TOP 5 
dp.subcategory,
SUM(fc.sales_amount) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_products AS dp --dimension
ON dp.product_key = fc.product_key
GROUP BY dp.subcategory
ORDER BY total_revenue DESC

--5 worst perfoming products
SELECT TOP 5 
dp.subcategory,
SUM(fc.sales_amount) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_products AS dp --dimension
ON dp.product_key = fc.product_key
GROUP BY dp.subcategory
ORDER BY total_revenue ASC

--top 10 customers that generated the highest revenue
SELECT TOP 10
dc.customer_key,
dc.first_name,
dc.last_name,
SUM(fc.sales_amount) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_customers AS dc --dimension
ON fc.customer_key = dc.customer_key
GROUP BY 
dc.customer_key, 
dc.first_name, 
dc.last_name
ORDER BY SUM(fc.sales_amount) DESC

--3 customers with fewest orders placed
SELECT TOP 3
dc.customer_key,
dc.first_name,
dc.last_name,
COUNT(fc.order_number) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_customers AS dc --dimension
ON fc.customer_key = dc.customer_key
GROUP BY 
dc.customer_key, 
dc.first_name, 
dc.last_name
ORDER BY SUM(fc.sales_amount) ASC