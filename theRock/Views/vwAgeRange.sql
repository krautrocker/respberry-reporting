CREATE       VIEW [theRock].[vwAgeRange]
AS
SELECT TOP 100 PERCENT
--JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
CAST(JSON_VALUE(data.value, '$.age') AS int) AS age,
CASE
	WHEN JSON_VALUE(data.value, '$.age')<5 THEN '< 5 Y'
	WHEN JSON_VALUE(data.value, '$.age')>=5 AND JSON_VALUE(data.value, '$.age')<=17 THEN '5-17 Y'
	WHEN JSON_VALUE(data.value, '$.age')>=18 THEN '18+ Y'
END AS ageRange
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE datasetName LIKE 'Request%'
AND
JSON_VALUE(data.value, '$.age') IS NOT NULL
GROUP BY
JSON_VALUE(data.value, '$.age')
UNION
SELECT TOP 100 PERCENT
--JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
CAST(JSON_VALUE(data.value, '$.age') AS int) AS age,
CASE
	WHEN JSON_VALUE(data.value, '$.age')<5 THEN '< 5 Y'
	WHEN JSON_VALUE(data.value, '$.age')>=5 AND JSON_VALUE(data.value, '$.age')<=17 THEN '5-17 Y'
	WHEN JSON_VALUE(data.value, '$.age')>=18 THEN '18+ Y'
END AS ageRange
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE datasetName LIKE 'Referrals%'
AND
JSON_VALUE(data.value, '$.age') IS NOT NULL
GROUP BY
JSON_VALUE(data.value, '$.age')
ORDER BY
age ASC