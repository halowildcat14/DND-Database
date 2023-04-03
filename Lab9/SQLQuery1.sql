BEGIN TRANSACTION
 SELECT 'Howard Snyder' AS 'original name'
 SELECT @@trancount AS 'trancount value'
 SELECT ContactName AS 'Before update' FROM Customers WHERE
CustomerID = 'GREAL'
 UPDATE Customers SET ContactName = 'Howard Snyder_Updated' WHERE
CustomerID ='GREAL'
 SELECT ContactName AS 'After update' FROM Customers WHERE CustomerID
= 'GREAL'
 SELECT @@trancount AS 'trancount value'
-- COMMIT TRANSACTION
SELECT ContactName FROM Customers WHERE CustomerID = 'GREAL'


BEGIN TRANSACTION
 UPDATE Customers SET ContactName = 'Howard Snyder' WHERE
CustomerID ='GREAL'
 SELECT ContactName FROM Customers WHERE
 CustomerID ='GREAL'