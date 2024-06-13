CREATE TABLE [theRock].[Facility] (
    [facilityId]  INT           IDENTITY (1, 1) NOT NULL,
    [code]        NVARCHAR (50) NULL,
    [contact]     NVARCHAR (50) NULL,
    [name]        NVARCHAR (50) NULL,
    [type]        NVARCHAR (50) NULL,
    [location]    NVARCHAR (50) NULL,
    [isActive]    BIT           CONSTRAINT [DF__Facility__isActi__50BBD860] DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) CONSTRAINT [DF__Facility__whoCre__51AFFC99] DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      CONSTRAINT [DF__Facility__whenCr__52A420D2] DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL
);