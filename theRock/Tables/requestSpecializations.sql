CREATE TABLE [theRock].[requestSpecializations] (
    [requestSpecializationId] INT           IDENTITY (1, 1) NOT NULL,
    [requestNumber]           NVARCHAR (25) NULL,
    [specializationId]        INT           NULL,
    [isActive]                BIT           DEFAULT ((1)) NULL,
    [whoCreated]              NVARCHAR (25) NULL,
    [whenCreated]             DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]              NVARCHAR (25) NULL,
    [whenChanged]             DATETIME      NULL
);