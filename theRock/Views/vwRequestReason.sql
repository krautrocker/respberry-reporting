CREATE     VIEW [theRock].[vwRequestReason] AS

SELECT
JSON_VALUE(data.value, '$.referralReason') AS requestReasonCode,
JSON_VALUE(data.value, '$.referralReason') AS requestReason
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Active'
GROUP BY
JSON_VALUE(data.value, '$.referralReason')
UNION
SELECT
JSON_VALUE(data.value, '$.referralReason') AS requestReasonCode,
JSON_VALUE(data.value, '$.referralReason') AS requestReason
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Closed'
GROUP BY
JSON_VALUE(data.value, '$.referralReason')
UNION
SELECT
JSON_VALUE(data.value, '$.referralReason') AS requestReasonCode,
JSON_VALUE(data.value, '$.referralReason') AS requestReason
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - In Progress'
GROUP BY
JSON_VALUE(data.value, '$.referralReason')