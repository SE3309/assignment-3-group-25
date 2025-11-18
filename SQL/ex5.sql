-- List all items for a specific storefront with price over 10.
SELECT Item_ID, ItemName, Price
FROM Item
WHERE Storefront_ID = 1
  AND Price > 10.00;


-- Show all orders with the customer name and restaurant name.
SELECT o.Order_ID,
       u.First_Name,
       u.Last_Name,
       s.Restaurant_Name,
       o.totalPrice,
       o.Status
FROM Orders o
JOIN Customer c ON o.Email = c.Email
JOIN Users u    ON c.Email = u.Email
JOIN Storefront s ON o.Storefront_ID = s.Storefront_ID
WHERE o.Status = 'PENDING';


-- Total number of orders per storefront.
SELECT s.Storefront_ID,
       s.Restaurant_Name,
       COUNT(o.Order_ID) AS NumOrders
FROM Storefront s
JOIN Orders o ON s.Storefront_ID = o.Storefront_ID
GROUP BY s.Storefront_ID, s.Restaurant_Name;


-- Average order total per storefront, showing only those with avg > 20.
SELECT s.Storefront_ID,
       s.Restaurant_Name,
       AVG(o.totalPrice) AS AvgOrderTotal
FROM Storefront s
JOIN Orders o ON s.Storefront_ID = o.Storefront_ID
GROUP BY s.Storefront_ID, s.Restaurant_Name
HAVING AVG(o.totalPrice) > 20.00;


-- Customers whose recorded Order_Count is higher than the average Order_Count.
SELECT c.Email,
       c.Order_Count,
       c.Favourite_Cuisine,
       c.Location
FROM Customer c
WHERE c.Order_Count >
      (SELECT AVG(Order_Count) FROM Customer);


-- Customers who have written at least one review.
SELECT c.Email,
       c.Order_Count,
       c.Location
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM Review r
    WHERE r.Email = c.Email
);


-- Items that have never been ordered.
SELECT i.Item_ID,
       i.ItemName,
       i.Price,
       s.Restaurant_Name
FROM Item i
JOIN Storefront s ON i.Storefront_ID = s.Storefront_ID
WHERE NOT EXISTS (
    SELECT 1
    FROM Order_Item oi
    WHERE oi.Item_ID = i.Item_ID
);