CREATE   VIEW [theRock].[vwRequestStatus]
AS

SELECT
--JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
JSON_VALUE(data.value, '$.status') AS requestStatusCode,
JSON_VALUE(data.value, '$.status') AS requestStatusName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE datasetName LIKE 'Request%'
AND
JSON_VALUE(data.value, '$.status') IS NOT NULL
GROUP BY
JSON_VALUE(data.value, '$.status')