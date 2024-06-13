CREATE TABLE [theRock].[Communities] (
    [communityId]    INT           IDENTITY (1, 1) NOT NULL,
    [community_name] NVARCHAR (50) NULL,
    [isActive]       BIT           DEFAULT ((1)) NULL,
    [whoCreated]     NVARCHAR (50) DEFAULT (suser_name()) NULL,
    [whenCreated]    DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]     NVARCHAR (50) NULL,
    [whenChanged]    DATETIME      NULL
);