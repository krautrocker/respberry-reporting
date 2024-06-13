CREATE             VIEW [theRock].[vwReferralServices]
AS
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
CAST(svc.value AS nvarchar(50)) AS serviceCode
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.services') AS svc
WHERE datasetName = 'Referrals';