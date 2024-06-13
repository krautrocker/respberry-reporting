CREATE TABLE [theRock].[referralStatus] (
    [referralStatusId]   INT           IDENTITY (1, 1) NOT NULL,
    [referralStatusCode] NVARCHAR (25) NULL,
    [referralStatusName] NVARCHAR (50) NULL,
    [isActive]           BIT           DEFAULT ((1)) NULL,
    [whoCreated]         NVARCHAR (50) DEFAULT (suser_name()) NULL,
    [whenCreated]        DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]         NVARCHAR (50) NULL,
    [whenChanged]        DATETIME      NULL
);