CREATE   VIEW [theRock].[vwClosureReason]
AS
SELECT
--JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
JSON_VALUE(data.value, '$.closureReason') AS closureReasonCode,
JSON_VALUE(data.value, '$.closureReason') AS closureReasonName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE datasetName LIKE 'Referrals%'
AND
JSON_VALUE(data.value, '$.closureReason') IS NOT NULL
GROUP BY
JSON_VALUE(data.value, '$.closureReason')