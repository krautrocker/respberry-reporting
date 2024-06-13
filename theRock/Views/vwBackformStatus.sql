CREATE   VIEW [theRock].[vwBackformStatus]
AS
SELECT
--JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
JSON_VALUE(data.value, '$.backformStatus') AS backformStatusCode,
JSON_VALUE(data.value, '$.backformStatus') AS backformStatusName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE datasetName LIKE 'Referrals%'
AND
JSON_VALUE(data.value, '$.backformStatus') IS NOT NULL
GROUP BY
JSON_VALUE(data.value, '$.backformStatus')