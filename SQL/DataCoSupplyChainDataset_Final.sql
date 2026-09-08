USE supply_chain_db;

-- ============================================
-- 1. DATABASE & TABLE CHECK
-- ============================================

SHOW TABLES;

SELECT COUNT(*) AS Total_Records
FROM datacosupplychaindataset_final;

SELECT *
FROM datacosupplychaindataset_final
LIMIT 10;


-- ============================================
-- 2. OVERALL SALES & PROFIT
-- ============================================

SELECT
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final;

SELECT
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final;

SELECT
    AVG(Sales) AS Average_Sales_Per_Order
FROM datacosupplychaindataset_final;

SELECT
    AVG(`Order Profit Per Order`) AS Average_Profit_Per_Order
FROM datacosupplychaindataset_final;


-- ============================================
-- 3. SALES BY MARKET
-- ============================================

SELECT
    Market,
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final
GROUP BY Market
ORDER BY Total_Sales DESC;


-- ============================================
-- 4. PROFIT BY MARKET
-- ============================================

SELECT
    Market,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final
GROUP BY Market
ORDER BY Total_Profit DESC;


-- ============================================
-- 5. MARKET PERFORMANCE
-- ============================================

SELECT
    Market,
    SUM(Sales) AS Total_Sales,
    SUM(`Order Profit Per Order`) AS Total_Profit,
    ROUND(
        (SUM(`Order Profit Per Order`) / SUM(Sales)) * 100,
        2
    ) AS Profit_Margin_Percent
FROM datacosupplychaindataset_final
GROUP BY Market
ORDER BY Profit_Margin_Percent DESC;


-- ============================================
-- 6. ORDERS BY MARKET
-- ============================================

SELECT
    Market,
    COUNT(*) AS Total_Orders
FROM datacosupplychaindataset_final
GROUP BY Market
ORDER BY Total_Orders DESC;


-- ============================================
-- 7. SALES BY SHIPPING MODE
-- ============================================

SELECT
    `Shipping Mode`,
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final
GROUP BY `Shipping Mode`
ORDER BY Total_Sales DESC;


-- ============================================
-- 8. ORDERS BY SHIPPING MODE
-- ============================================

SELECT
    `Shipping Mode`,
    COUNT(*) AS Total_Orders
FROM datacosupplychaindataset_final
GROUP BY `Shipping Mode`
ORDER BY Total_Orders DESC;


-- ============================================
-- 9. PROFIT BY SHIPPING MODE
-- ============================================

SELECT
    `Shipping Mode`,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final
GROUP BY `Shipping Mode`
ORDER BY Total_Profit DESC;


-- ============================================
-- 10. TOP 10 PRODUCTS BY SALES
-- ============================================

SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


-- ============================================
-- 11. TOP 10 PRODUCTS BY PROFIT
-- ============================================

SELECT
    `Product Name`,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;


-- ============================================
-- 12. HIGHEST PROFIT PRODUCT
-- ============================================

SELECT
    `Product Name`,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 1;


-- ============================================
-- 13. SALES BY CATEGORY
-- ============================================

SELECT
    `Category Name`,
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final
GROUP BY `Category Name`
ORDER BY Total_Sales DESC;


-- ============================================
-- 14. PROFIT BY CATEGORY
-- ============================================

SELECT
    `Category Name`,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final
GROUP BY `Category Name`
ORDER BY Total_Profit DESC;


-- ============================================
-- 15. SALES BY ORDER REGION
-- ============================================

SELECT
    `Order Region`,
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final
GROUP BY `Order Region`
ORDER BY Total_Sales DESC;


-- ============================================
-- 16. PROFIT BY ORDER REGION
-- ============================================

SELECT
    `Order Region`,
    SUM(`Order Profit Per Order`) AS Total_Profit
FROM datacosupplychaindataset_final
GROUP BY `Order Region`
ORDER BY Total_Profit DESC;


-- ============================================
-- 17. TOP 5 ORDER COUNTRIES BY SALES
-- ============================================

SELECT
    `Order Country`,
    SUM(Sales) AS Total_Sales
FROM datacosupplychaindataset_final
GROUP BY `Order Country`
ORDER BY Total_Sales DESC
LIMIT 5;
