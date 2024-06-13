CREATE TABLE [theRock].[SubServices] (
    [subServiceId]   INT           IDENTITY (1, 1) NOT NULL,
    [subServiceName] NVARCHAR (50) NULL,
    [subServiceCode] NVARCHAR (50) NULL,
    [isActive]       BIT           CONSTRAINT [DF__SubServic__isAct__7F76C749] DEFAULT ((1)) NULL,
    [whoCreated]     NVARCHAR (50) CONSTRAINT [DF__SubServic__whoCr__006AEB82] DEFAULT (suser_name()) NULL,
    [whenCreated]    DATETIME      CONSTRAINT [DF__SubServic__whenC__015F0FBB] DEFAULT (getdate()) NULL,
    [whoChanged]     NVARCHAR (50) NULL,
    [whenChanged]    DATETIME      NULL
);