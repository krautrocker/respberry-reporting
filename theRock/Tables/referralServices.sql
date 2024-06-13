CREATE TABLE [theRock].[referralServices] (
    [referralServiceId] INT           IDENTITY (1, 1) NOT NULL,
    [referralNumber]    NVARCHAR (25) NULL,
    [serviceCode]       NVARCHAR (25) NULL,
    [isActive]          BIT           CONSTRAINT [DF__referralS__isAct__59DB2E46] DEFAULT ((1)) NULL,
    [whoCreated]        NVARCHAR (25) NULL,
    [whenCreated]       DATETIME      CONSTRAINT [DF__referralS__whenC__5ACF527F] DEFAULT (getdate()) NULL,
    [whoChanged]        NVARCHAR (25) NULL,
    [whenChanged]       DATETIME      NULL
);