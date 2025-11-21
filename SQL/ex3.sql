-- ============================================================
-- SE3309 - Assignment 3
-- ex3.sql : INSERT statements (3 types)
-- Relation used: ITEM
-- Columns: Item_ID, Storefront_ID, ItemName, Price
-- ============================================================

-- ============================================================
-- 1) INSERT TYPE #1: INSERT ... VALUES
-- Standard SQL insert of a new item
-- ============================================================
INSERT INTO Item (Item_ID, Storefront_ID, ItemName, Price)
VALUES (2001, 10, 'Chicken Biryani', 13.99);

-- ============================================================
-- 2) INSERT TYPE #2: INSERT ... SET
-- MySQL-style insert using SET assignments
-- ============================================================
INSERT INTO Item
SET Item_ID = 2002,
    Storefront_ID = 10,
    ItemName = 'Veggie Samosa Pack',
    Price = 5.50;

-- ============================================================
-- 3) INSERT TYPE #3: INSERT ... SELECT
-- Interesting insert: copy an existing item, modify the name.
-- This assumes Item_ID = 2001 exists from Insert #1.
-- ============================================================
INSERT INTO Item (Item_ID, Storefront_ID, ItemName, Price)
SELECT
    2999,                          -- new Item_ID
    Storefront_ID,
    CONCAT(ItemName, ' (Large)'),  -- modify original name
    Price + 2.00                   -- adjust price
FROM Item
WHERE Item_ID = 2001;

-- ============================================================
-- 4) Final verification: Show all tuples in ITEM
-- (You will screenshot this after execution)
-- ============================================================
SELECT * FROM Item;
