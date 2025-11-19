--Increase the price of items that have sold more than 10 units by 10%
UPDATE Item
SET Price = Price * 1.10
WHERE Item_ID IN (
    SELECT Item_ID
    FROM Order_Item
    GROUP BY Item_ID
    HAVING SUM(Quantity) > 10
);

-- Delete reviews from customers who have never placed an order
DELETE FROM Review
WHERE Email IN (
    SELECT c.Email
    FROM Customer c
    LEFT JOIN Orders o ON c.Email = o.Email
    WHERE o.Order_ID IS NULL
);

-- Insert a 'None' allergy for customers who do not have any allergy recorded
INSERT INTO Customer_Allergy (Email, Allergy)
SELECT c.Email, 'None'
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Customer_Allergy ca
    WHERE ca.Email = c.Email
);
