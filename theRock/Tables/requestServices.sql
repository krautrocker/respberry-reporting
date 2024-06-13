CREATE TABLE [theRock].[requestServices] (
    [requestServiceId] INT           IDENTITY (1, 1) NOT NULL,
    [requestNumber]    NVARCHAR (25) NULL,
    [serviceCode]      NVARCHAR (25) NULL,
    [isActive]         BIT           CONSTRAINT [DF__requestSe__isAct__6A11960F] DEFAULT ((1)) NULL,
    [whoCreated]       NVARCHAR (25) NULL,
    [whenCreated]      DATETIME      CONSTRAINT [DF__requestSe__whenC__6B05BA48] DEFAULT (getdate()) NULL,
    [whoChanged]       NVARCHAR (25) NULL,
    [whenChanged]      DATETIME      NULL
);