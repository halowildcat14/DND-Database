USE NWindmalikjp38
GO

 CREATE TYPE LoginID FROM int NOT NULL;

 CREATE TYPE FirstName FROM VARCHAR(20) NOT NULL;
 CREATE TYPE LastName FROM VARCHAR(20) NOT NULL;

 CREATE TYPE stateIn FROM VARCHAR(2) NOT NULL;

 CREATE TYPE DoB FROM DATE NOT NULL;

 GO

 CREATE TABLE UserProfiles
  (
     LoginID LoginID PRIMARY KEY,
     FirstName FirstName,
	 LastName LastName,
	 stateIn StateIn,
	 Dob Dob
  );

 GO

 ALTER TABLE UserProfiles ADD StateIn stateIn
 go

 ALTER TABLE UserProfiles ADD CONSTRAINT CK_Dob
	CHECK ( CURRENT_TIMESTAMP > Dob AND Dob > '1900-01-01')

GO
 