CREATE TABLE Shipments (
    ID INT PRIMARY KEY,
    Warehouse_block VARCHAR(50),
    Mode_of_Shipment VARCHAR(50),
    Customer_care_calls INT,
    Customer_rating INT,
    Cost_of_the_Product DECIMAL(10, 2),
    Prior_purchases INT,
    Product_importance VARCHAR(50),
    Discount_offered DECIMAL(10, 2),
    Weight_in_gms DECIMAL(10, 2),
    Reached_on_Time_Y_N INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/logistics.csv'
INTO TABLE Shipments
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID, Warehouse_block, Mode_of_Shipment, Customer_care_calls, Customer_rating, Cost_of_the_Product, Prior_purchases, 
Product_importance, Discount_offered, Weight_in_gms, Reached_on_Time_Y_N);

SELECT COUNT(*) AS LateDeliveries
FROM Shipments
WHERE Reached_on_Time_Y_N = 'N';

SELECT Mode_of_Shipment, COUNT(*) AS LateDeliveries
FROM shipments
WHERE Reached_on_Time_Y_N = 'N'
GROUP BY Mode_of_Shipment
ORDER BY LateDeliveries DESC;

SELECT 
    Warehouse_block,
    SUM(Cost_of_the_Product - Discount_offered) AS TotalRevenue
FROM Shipments
GROUP BY Warehouse_block;


use Logistics;

