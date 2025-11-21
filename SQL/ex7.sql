
CREATE VIEW v_storefront_summary AS
SELECT 
    s.Storefront_ID,
    s.Restaurant_Name,
    u.First_Name,
    u.Last_Name,
    s.Location,
    AVG(r.Score) AS avg_score,
    COUNT(DISTINCT i.Item_ID) AS num_items
FROM Storefront s
JOIN Chef c ON s.Email = c.Email
JOIN Users u ON c.Email = u.Email
LEFT JOIN Review r ON r.Storefront_ID = s.Storefront_ID
LEFT JOIN Item i ON i.Storefront_ID = s.Storefront_ID
GROUP BY 
    s.Storefront_ID,
    s.Restaurant_Name,
    u.First_Name,
    u.Last_Name,
    s.Location;

    -- Query View 1
SELECT * FROM v_storefront_summary LIMIT 10;


    INSERT INTO v_storefront_summary (
    Storefront_ID,
    Restaurant_Name,
    First_Name,
    Last_Name,
    Location,
    avg_score,
    num_items
) VALUES (
    999,
    'Test Restaurant',
    'Test',
    'Chef',
    'Test City',
    NULL,
    0
);



CREATE VIEW v_customer_basic AS
SELECT 
    Email,
    Order_Count,
    Favourite_Cuisine,
    Location
FROM Customer;



SELECT * FROM v_customer_basic LIMIT 10;





UPDATE v_customer_basic
SET Location = 'Updated Location'
WHERE Email = 'aahrenje@go.com';