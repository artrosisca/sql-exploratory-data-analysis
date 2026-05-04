--total sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

--how many items sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

--avg selling price
SELECT AVG(price) AS average_price FROM gold.fact_sales

--total number of orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales
SELECT * FROM gold.fact_sales --mesmo customers pediu 3 produtos diferentes, tem 3 linhas, mas só 1 pedido

--total number of products
SELECT COUNT(product_key) AS total_products FROM gold.dim_products --you cna search using product_key or product_name, names are also unique
SELECT COUNT(DISTINCT product_key) AS total_products FROM gold.dim_products

--total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers --you can search using customer_key or customer_number, names are not unique

--total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales; 

--generate a report with all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Number Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Number Products', COUNT(DISTINCT product_key) FROM gold.dim_products
UNION ALL
SELECT 'Total Number Customers', COUNT(customer_key) FROM gold.dim_customers