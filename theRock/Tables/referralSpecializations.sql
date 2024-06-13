CREATE TABLE [theRock].[referralSpecializations] (
    [referralSpecializationId] INT           IDENTITY (1, 1) NOT NULL,
    [referralNumber]           NVARCHAR (25) NULL,
    [specializationId]         INT           NULL,
    [isActive]                 BIT           DEFAULT ((1)) NULL,
    [whoCreated]               NVARCHAR (25) NULL,
    [whenCreated]              DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]               NVARCHAR (25) NULL,
    [whenChanged]              DATETIME      NULL
);