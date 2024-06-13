CREATE TABLE [theRock].[Gender] (
    [genderId]    INT           IDENTITY (1, 1) NOT NULL,
    [genderCode]  NVARCHAR (25) NULL,
    [genderName]  NVARCHAR (50) NULL,
    [isActive]    BIT           DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL
);