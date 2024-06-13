CREATE TABLE [theRock].[Ambulance] (
    [ambulanceId] INT           IDENTITY (1, 1) NOT NULL,
    [code]        NVARCHAR (50) NULL,
    [phoneNumber] NVARCHAR (50) NULL,
    [name]        NVARCHAR (50) NULL,
    [isActive]    BIT           CONSTRAINT [DF__Ambulance__isAct__4CEB477C] DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) CONSTRAINT [DF__Ambulance__whoCr__4DDF6BB5] DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      CONSTRAINT [DF__Ambulance__whenC__4ED38FEE] DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL
);