CREATE                   VIEW [theRock].[vwRequestServices]
AS
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS requestNumber,
CAST(svc.value AS nvarchar(25)) AS serviceCode
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.services') AS svc
WHERE datasetName LIKE 'Requests%'
GROUP BY
JSON_VALUE(data.value, '$.referralNumber'),
CAST(svc.value AS nvarchar(25))
UNION
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS requestNumber,
CAST(svc.value AS nvarchar(25)) AS serviceCode
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.services') AS svc
WHERE datasetName LIKE 'Referral%'
GROUP BY
JSON_VALUE(data.value, '$.referralNumber'),
CAST(svc.value AS nvarchar(25))