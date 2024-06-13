CREATE TABLE [theRock].[ServiceAvailability] (
    [availabilityId]  INT           IDENTITY (1, 1) NOT NULL,
    [serviceCode]     NVARCHAR (50) NULL,
    [isAvailable]     BIT           NULL,
    [dayOfWeek]       NVARCHAR (10) NULL,
    [dayAvailability] BIT           NULL,
    [isActive]        BIT           DEFAULT ((1)) NULL,
    [whoCreated]      NVARCHAR (50) DEFAULT (suser_name()) NULL,
    [whenCreated]     DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]      NVARCHAR (50) NULL,
    [whenChanged]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([availabilityId] ASC)
);