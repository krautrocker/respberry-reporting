CREATE VIEW [theRock].[vwOffer]
AS
SELECT
referralNumber,
isAccepted,
isDeclined,
offerStatusCode,
originFacilityCode,
destinationFacilityCode
FROM
[theRock].Offer