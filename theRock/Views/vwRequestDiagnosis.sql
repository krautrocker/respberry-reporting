CREATE                 VIEW [theRock].[vwRequestDiagnosis] AS
SELECT
JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosisCode,
JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosis
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName='Requests - Active'
UNION
SELECT
JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosisCode,
JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosis
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName='Requests - Closed'
GROUP BY
JSON_VALUE(data.value, '$.forwardDiagnosis')
UNION
SELECT
JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosisCode,
JSON_VALUE(data.value, '$.forwardDiagnosis') AS forwardDiagnosis
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
WHERE
datasetName='Requests - In Progress'
GROUP BY JSON_VALUE(data.value, '$.forwardDiagnosis')