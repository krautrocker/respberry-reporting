CREATE TABLE [theRock].[User] (
    [userId]      INT           IDENTITY (1, 1) NOT NULL,
    [email]       NVARCHAR (50) NULL,
    [name]        NVARCHAR (50) NULL,
    [phoneNumber] NVARCHAR (50) NULL,
    [language]    NVARCHAR (50) NULL,
    [deviceToken] NVARCHAR (50) NULL,
    [isActive]    BIT           CONSTRAINT [DF__User__isActive__0347582D] DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) CONSTRAINT [DF__User__whoCreated__043B7C66] DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      CONSTRAINT [DF__User__whenCreate__052FA09F] DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL
);