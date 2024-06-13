CREATE TABLE [theRock].[Address] (
    [addressId]        INT           IDENTITY (1, 1) NOT NULL,
    [governorateId]    INT           NULL,
    [countryId]        INT           NULL,
    [governorate_name] NVARCHAR (50) NULL,
    [district_name]    NVARCHAR (50) NULL,
    [subdistrict_name] NVARCHAR (50) NULL,
    [community_name]   NVARCHAR (50) NULL,
    [isActive]         BIT           CONSTRAINT [DF__Address__isActiv__491AB698] DEFAULT ((1)) NULL,
    [whoCreated]       NVARCHAR (50) CONSTRAINT [DF__Address__whoCrea__4A0EDAD1] DEFAULT (suser_name()) NULL,
    [whenCreated]      DATETIME      CONSTRAINT [DF__Address__whenCre__4B02FF0A] DEFAULT (getdate()) NULL,
    [whoChanged]       NVARCHAR (50) NULL,
    [whenChanged]      DATETIME      NULL,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([addressId] ASC)
);