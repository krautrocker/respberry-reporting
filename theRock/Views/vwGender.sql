CREATE                   VIEW [theRock].[vwGender] AS

SELECT
JSON_VALUE(data.value, '$.patientGender') AS genderCode,
JSON_VALUE(data.value, '$.patientGender') AS genderName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Active'
GROUP BY
JSON_VALUE(data.value, '$.patientGender')
UNION
SELECT
JSON_VALUE(data.value, '$.patientGender') AS genderCode,
JSON_VALUE(data.value, '$.patientGender') AS genderName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Closed'
GROUP BY
JSON_VALUE(data.value, '$.patientGender')
UNION
SELECT
JSON_VALUE(data.value, '$.patientGender') AS genderCode,
JSON_VALUE(data.value, '$.patientGender') AS genderName
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - In Progress'
GROUP BY
JSON_VALUE(data.value, '$.patientGender')