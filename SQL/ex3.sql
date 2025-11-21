INSERT INTO USERS (Email,Password,First_Name,Last_Name) VALUES ("yellowali@icloud.com",12345678,"Ali","Elgalad");

INSERT INTO Users (Email, Password, First_Name, Last_Name)
VALUES 
("omar@icloud..com", "test456", "Omar", "Fahmy"),
("lina@icloud..com", "apple789", "Lina", "Rizk");

INSERT INTO Users (Email, Password, First_Name, Last_Name)
SELECT 
    CONCAT("copy_", Email),
    Password,
    CONCAT(First_Name, "_Copy"),
    Last_Name
FROM Users
WHERE Email = "yellowali@icloud.com";

SELECT * FROM USERS;