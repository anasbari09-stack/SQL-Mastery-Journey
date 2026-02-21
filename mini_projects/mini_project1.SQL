-- Task 1: The "Premium Supplier" Price Bump (Subqueries)
-- The Logic (L-mantiq): We want to reward our best suppliers.
-- The Goal: Increase the price_cny by 10% for all products in the inventory table, but ONLY if the product belongs to a supplier whose rating is greater than 4.8.
UPDATE inventory

SET price_cny = price_cny * 1.10

WHERE supplier_id IN (SELECT supplier_id FROM suppliers

WHERE rating > 4.8 )

-- Task 2: The "Bottleneck" Discovery (Advanced Aggregation)
-- The Logic (L-mantiq): The AI model needs to know which suppliers are causing delays in Morocco.
-- The Goal: List the supplier_name and the Average Delivery Days for all their shipments, but only for shipments that are NOT 'Cancelled'.
-- Filter: Only show suppliers who have an average delivery time of more than 15 days.
SELECT s.supplier_name, AVG(sh.delivery_days)
FROM suppliers AS s
JOIN inventory AS i ON s.supplier_id = i.supplier_id
JOIN shipments AS sh ON i.sku_id = sh.sku_id
WHERE sh.status != 'Cancelled'
GROUP BY s.supplier_name
HAVING AVG(sh.delivery_days) > 15;

-- Task 3: The "Data Purge" (Safe Deletion)
-- The Logic (L-mantiq): Our database is getting heavy. We need to delete old, useless data.
-- The Goal: Delete all records from the shipments table where the status is 'Cancelled' AND the delivery_days is NULL (meaning it never even started).
DELETE FROM shipments
WHERE status = 'Cancelled' AND delivery_days IS NULL;