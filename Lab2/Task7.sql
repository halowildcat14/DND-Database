USE NWindmalikjp38
Go


Select cat.CategoryID, cat.CategoryName, CAST( AVG(UnitPrice) AS DECIMAL (10,2)) AS AverageUnitPrice
From Products pro
	JOIN Categories cat ON pro.CategoryID = cat.CategoryID
GROUP BY cat.CategoryID, cat.CategoryName
HAVING AVG(UnitPrice) > 25.00
ORDER BY AverageUnitPrice DESC

--So the Cast On the Average makes it to two decimal places while the AVG gets the average of
--All UnitPrices in the Group
--Join gets the CAtagories table and Products table together
--Group By puts the unit prices together by CatagoryId and I put Catagory Name in there as well
--So I can get it out later
-- HAving is like where cept alows me to do it on the AVG unitPrice
--Order orders from greatest to least the AveragePrice
