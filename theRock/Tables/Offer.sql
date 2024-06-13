CREATE TABLE [theRock].[Offer]
(
	offerId INT IDENTITY(1,1) NOT NULL,
	referralNumber nvarchar(50),
	isAccepted bit DEFAULT NULL,
	isDeclined bit DEFAULT NULL,
	offerStatusCode nvarchar(50),
	originFacilityCode nvarchar(50),
	destinationFacilityCode nvarchar(50),
)