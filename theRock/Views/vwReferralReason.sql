CREATE   VIEW [theRock].[vwReferralReason] AS

SELECT
JSON_VALUE(data.value, '$.referralReason') AS referralReasonCode,
JSON_VALUE(data.value, '$.referralReason') AS referralReason
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Active'
GROUP BY
JSON_VALUE(data.value, '$.referralReason')
UNION
SELECT
JSON_VALUE(data.value, '$.referralReason') AS referralReasonCode,
JSON_VALUE(data.value, '$.referralReason') AS referralReason
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Closed'
GROUP BY
JSON_VALUE(data.value, '$.referralReason')