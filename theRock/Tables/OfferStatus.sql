CREATE TABLE [theRock].[OfferStatus]
(
	[OfferStatusId] INT IDENTITY(1,1) NOT NULL,
	OfferStatusCode		NVARCHAR(50),
	OfferStatusName		NVARCHAR(50),
	[isActive]          BIT           DEFAULT ((1)) NULL,
	[whoCreated]        NVARCHAR (50) DEFAULT (suser_name()) NULL,
	[whenCreated]       DATETIME      DEFAULT (getdate()) NULL,
	[whoChanged]        NVARCHAR (50) NULL,
	[whenChanged]       DATETIME      NULL

)