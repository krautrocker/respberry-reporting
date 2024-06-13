CREATE TABLE [theRock].[Services] (
    [serviceId]   INT           IDENTITY (1, 1) NOT NULL,
    [serviceName] NVARCHAR (50) NULL,
    [serviceCode] NVARCHAR (50) NULL,
    [isActive]    BIT           CONSTRAINT [DF__Services__isActi__7AB2122C] DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) CONSTRAINT [DF__Services__whoCre__7BA63665] DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      CONSTRAINT [DF__Services__whenCr__7C9A5A9E] DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL
);