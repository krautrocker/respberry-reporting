CREATE VIEW theRock.vwPhaseTracker
AS
SELECT
    fac.name AS FacilityName,
    ref.referralNumber AS ReferralNumber,
    CASE
        WHEN ref.referralNumber IS NOT NULL THEN '1'
        ELSE '0'
    END AS phaseReferral,
    CASE
        WHEN req.referralNumber IS NOT NULL THEN '1'
        ELSE '0'
    END AS phaseRequest,
    CASE
        WHEN [ofr].referralNumber IS NOT NULL THEN '1'
        ELSE '0'
    END AS phaseOffer,
    CASE
        WHEN [bkfm].referralNumber IS NOT NULL THEN '1'
        ELSE '0'
    END AS phaseBackform,
    COUNT(ref.referralNumber) OVER(PARTITION BY fac.name) AS TotalReferrals,
    COUNT(req.referralNumber) OVER(PARTITION BY fac.name) AS TotalRequests,
    COUNT([ofr].referralNumber) OVER(PARTITION BY fac.name) AS TotalOffers,
    COUNT([bkfm].referralNumber) OVER(PARTITION BY fac.name) AS TotalBackforms,
    DATEDIFF(DAY, ref.createdAt, ISNULL(req.createdAt, GETDATE())) AS DaysInReferral,
    --DATEDIFF(DAY, req.createdAt, ISNULL([ofr].createdAt, GETDATE())) AS DaysInRequest,
	DATEDIFF(DAY, req.createdAt, GETDATE()) AS DaysInRequest,
    --DATEDIFF(DAY, [ofr]., ISNULL([bkfm].createdAt, GETDATE())) AS DaysInOffer,
    DATEDIFF(DAY, ref.createdAt, ISNULL([bkfm].createdAt, GETDATE())) AS TotalDaysInProcess
FROM
    theRock.Referrals ref
LEFT OUTER JOIN
    theRock.Requests req ON ref.referralNumber = req.referralNumber
LEFT OUTER JOIN
    theRock.Offer [ofr] ON req.referralNumber = [ofr].referralNumber
LEFT OUTER JOIN
    theRock.Backform [bkfm] ON ref.referralNumber = [bkfm].referralNumber
LEFT OUTER JOIN
    theRock.Facility fac ON ref.originFacilityCode = fac.code;


--SELECT
--fac.name,
--ref.referralNumber,
--CASE
--	WHEN ref.referralNumber IS NOT NULL THEN '1'
--	ELSE 0
--END AS phaseReferral,
--CASE
--	WHEN req.referralNumber IS NOT NULL THEN '1'
--	ELSE 0
--END AS phaseRequest,
--CASE
--	WHEN [ofr].referralNumber IS NOT NULL THEN '1'
--	ELSE 0
--END AS phaseOffer,
--CASE
--	WHEN [bkfm].referralNumber IS NOT NULL THEN '1'
--	ELSE 0
--END AS phaseBackform
--FROM
--theRock.Referrals ref
--LEFT OUTER JOIN
--theRock.Requests req ON ref.referralNumber=req.referralNumber
--LEFT OUTER JOIN
--theRock.Offer [ofr] ON req.referralNumber=ofr.referralNumber
--LEFT OUTER JOIN
--theRock.Backform [bkfm] ON ref.referralNumber=[bkfm].referralNumber
--LEFT OUTER JOIN
--theRock.Facility fac ON ref.originFacilityCode=fac.code

--SELECT referralNumber FROM theRock.Referrals ORDER BY referralNumber ASC
--SELECT referralNumber FROM theRock.Requests ORDER BY referralNumber ASC