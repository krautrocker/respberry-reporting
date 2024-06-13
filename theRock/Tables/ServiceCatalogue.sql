CREATE TABLE [theRock].[ServiceCatalogue] (
    [serviceCatalogueId] INT           IDENTITY (1, 1) NOT NULL,
    [group]              NVARCHAR (50) NULL,
    [groupName]          NVARCHAR (50) NULL,
    [serviceName]        NVARCHAR (50) NULL,
    [serviceCode]        NVARCHAR (50) NULL,
    [subServiceName]     NVARCHAR (50) NULL,
    [subServiceCode]     NVARCHAR (50) NULL,
    [isActive]           BIT           CONSTRAINT [DF__ServiceCa__isAct__20D7BB14] DEFAULT ((1)) NULL,
    [whoCreated]         NVARCHAR (50) CONSTRAINT [DF__ServiceCa__whoCr__21CBDF4D] DEFAULT (suser_name()) NULL,
    [whenCreated]        DATETIME      CONSTRAINT [DF__ServiceCa__whenC__22C00386] DEFAULT (getdate()) NULL,
    [whoChanged]         NVARCHAR (50) NULL,
    [whenChanged]        DATETIME      NULL,
    CONSTRAINT [PK__ServiceC__B762209087279515] PRIMARY KEY CLUSTERED ([serviceCatalogueId] ASC)
);