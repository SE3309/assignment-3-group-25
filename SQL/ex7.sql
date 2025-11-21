USE comforteats;

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
