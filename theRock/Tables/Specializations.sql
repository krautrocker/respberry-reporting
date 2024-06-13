CREATE TABLE [theRock].[Specializations] (
    [specializationId]   INT            IDENTITY (1, 1) NOT NULL,
    [specializationCode] NVARCHAR (50)  NULL,
    [specializationName] NVARCHAR (150) NULL,
    [isActive]           BIT            DEFAULT ((1)) NULL,
    [whoCreated]         NVARCHAR (50)  DEFAULT (suser_sname()) NULL,
    [whenCreated]        DATETIME       DEFAULT (getdate()) NULL,
    [whenChanged]        NVARCHAR (50)  NULL,
    [whoChanged]         DATETIME       NULL
);