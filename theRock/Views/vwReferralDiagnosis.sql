CREATE   VIEW [theRock].[vwReferralDiagnosis] AS

SELECT
    JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosisCode,
	JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosis
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Active'
GROUP BY
JSON_VALUE(data.value, '$.forwardDiagnosis')
UNION
SELECT
    JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosisCode,
    JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosis
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName LIKE 'Referrals - Closed'
GROUP BY
JSON_VALUE(data.value, '$.forwardDiagnosis')