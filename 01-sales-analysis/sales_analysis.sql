-- Data Analytics Portfolio
-- Project: Sales Analysis
-- Goal: Analyze sales performance using SQL

-- 1. Create a sample sales table
CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2)
);

-- 2. Insert sample data
INSERT INTO sales VALUES
(1, '2026-01-05', 'Laptop', 'Electronics', 2, 750.00),
(2, '2026-01-07', 'Mouse', 'Accessories', 5, 25.00),
(3, '2026-01-10', 'Keyboard', 'Accessories', 3, 45.00),
(4, '2026-02-02', 'Monitor', 'Electronics', 2, 220.00),
(5, '2026-02-12', 'Laptop', 'Electronics', 1, 750.00),
(6, '2026-02-18', 'Mouse', 'Accessories', 10, 25.00),
(7, '2026-03-03', 'Monitor', 'Electronics', 3, 220.00),
(8, '2026-03-15', 'Keyboard', 'Accessories', 4, 45.00);

-- 3. Total revenue
SELECT
    SUM(quantity * price) AS total_revenue
FROM sales;

-- 4. Revenue by product
SELECT
    product,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;

-- 5. Revenue by category
SELECT
    category,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 6. Monthly revenue
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(quantity * price) AS monthly_revenue
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sales_year, sales_month;
