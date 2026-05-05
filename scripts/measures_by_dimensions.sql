--Measures(fact) By Dimensions(dim)--

--total customers by countries
SELECT 
country, --first add the dimension
COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC --sort the data by the measure

--total customers by gender
SELECT 
gender,
COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC

--total products by category
SELECT 
category,
COUNT(product_key) AS total_products
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC

--avg cost by category
SELECT 
category,
AVG(cost) AS avg_cost
FROM gold.dim_products
GROUP BY category
ORDER BY avg_cost DESC

--total revenue by category
SELECT
dp.category,
SUM(fc.sales_amount) AS total_revenue
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_products AS dp --dimension
ON dp.product_key = fc.product_key
GROUP BY dp.category
ORDER BY total_revenue DESC

--total revenue by customer
SELECT 
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

--sold items accros country
SELECT 
dc.country,
SUM(fc.quantity) AS total_sold_items
FROM gold.fact_sales AS fc --measure
LEFT JOIN gold.dim_customers AS dc --dimension
ON fc.customer_key = dc.customer_key
GROUP BY dc.country
ORDER BY total_sold_items DESC

--category by gender
SELECT 
dp.category,
dc.gender,
COUNT(fs.customer_key) AS total_orders,
SUM(fs.sales_amount) AS total_revenue
FROM gold.fact_sales AS fs
LEFT JOIN gold.dim_products AS dp 
ON fs.product_key = dp.product_key
LEFT JOIN gold.dim_customers AS dc 
ON fs.customer_key = dc.customer_key
GROUP BY 
dp.category, 
dc.gender
ORDER BY 
dp.category, 
total_orders DESC;