/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.4232)
    Source Database Engine Edition : Microsoft SQL Server Standard Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2014
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [NWindmalikjp38]
GO

/****** Object:  Table [dbo].[UserProfiles]    Script Date: 4/5/2018 1:29:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserProfiles](
	[LoginID] [dbo].[LoginID] NOT NULL,
	[FirstName] [dbo].[FirstName] NOT NULL,
	[LastName] [dbo].[LastName] NOT NULL,
	[stateIn] [dbo].[stateIn] NOT NULL,
	[Dob] [dbo].[DoB] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [CK_Dob] CHECK  ((getdate()>[Dob] AND [Dob]>'1900-01-01'))
GO

ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [CK_Dob]
GO


