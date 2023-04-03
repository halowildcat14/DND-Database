USE NWindmalikjp38
Go

ALTER TABLE Login ADD CONSTRAINT PK_Username
	UNIQUE (Username)

GO