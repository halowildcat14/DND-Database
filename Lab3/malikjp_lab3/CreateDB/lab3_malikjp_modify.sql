use [Lab3-2_malikjp]

ALTER DATABASE [Lab3-2_malikjp]
   
	MODIFY FILE 
	(NAME = 'Lab3-2_malikjp_log'     
    , SIZE = 10MB )
GO

ALTER DATABASE [Lab3-2_malikjp]
   
	MODIFY FILE 
	(NAME = 'Lab3-2_malikjp_log'     
    , MAXSIZE = 30MB )
GO

ALTER DATABASE [Lab3-2_malikjp]
   
	MODIFY FILE 
	(NAME = 'Lab3-2_malikjp_log'     
    , FILEGROWTH = 22% )
GO
       
sp_helpdb [Lab3-2_malikjp]
