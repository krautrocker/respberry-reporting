CREATE               VIEW [theRock].[vwReferralStatus]
AS
SELECT
--JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
JSON_VALUE(data.value, '$.status') AS referralStatusCode,
JSON_VALUE(data.value, '$.status') AS referralStatusName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE datasetName LIKE 'Referrals%'
GROUP BY
JSON_VALUE(data.value, '$.status')