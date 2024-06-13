CREATE TABLE [theRock].[activityHistory]
(
	[activityId] INT IDENTITY(1,1) NOT NULL,
	activityCode nvarchar(50),
	activityDescription nvarchar(255),
	activityPhaseCode nvarchar(50),
	activityModeCode nvarchar(50),
	entityLevelCode nvarchar(50),
	isUrgent BIT DEFAULT NULL,
	isActive bit DEFAULT 1,
	whoCreated nvarchar(50) DEFAULT SUSER_NAME(),
	whenCreated datetime DEFAULT GETDATE(),
	whoChanged nvarchar(50),
	whenChanged datetime
)