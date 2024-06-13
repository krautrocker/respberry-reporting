CREATE TABLE [theRock].[processSteps]
(
	[processStepId] INT IDENTITY(1,1) NOT NULL,
	processStepCode nvarchar(25),
	processStepName nvarchar(50),
	[isActive]         BIT           DEFAULT ((1)) NULL,
	[whoCreated]       NVARCHAR (50) DEFAULT (suser_name()) NULL,
	[whenCreated]      DATETIME      DEFAULT (getdate()) NULL,
	[whoChanged]       NVARCHAR (50) NULL,
	[whenChanged]      DATETIME      NULL,
)