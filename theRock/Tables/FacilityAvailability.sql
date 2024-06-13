CREATE TABLE [theRock].[FacilityAvailability] (
    [facilityId]  INT           IDENTITY (1, 1) NOT NULL,
    [code]        NVARCHAR (50) NULL,
    [contact]     NVARCHAR (50) NULL,
    [name]        NVARCHAR (50) NULL,
    [type]        NVARCHAR (50) NULL,
    [location]    NVARCHAR (50) NULL,
    [serviceCode] NVARCHAR (50) NULL,
    [DayOfWeek]   NVARCHAR (50) NULL,
    [isAvailable] NVARCHAR (5)  NULL,
    [isActive]    BIT           CONSTRAINT [DF__FacilityA__isAct__0BDC9E2E] DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) CONSTRAINT [DF__FacilityA__whoCr__0CD0C267] DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      CONSTRAINT [DF__FacilityA__whenC__0DC4E6A0] DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL
);