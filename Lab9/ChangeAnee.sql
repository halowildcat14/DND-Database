BEGIN TRANSACTION
 UPDATE Employees
 SET Title = 'Sales Manager', Address = '8 Houndstooth Road'
 WHERE FirstName ='Anne', LastName='Dodsworth'
