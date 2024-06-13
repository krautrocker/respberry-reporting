CREATE             VIEW [theRock].[vwRequestSpecializations] AS
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
--svc.value AS serviceCode,
CAST(spec.value AS nvarchar(50)) AS specializationCode
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
--OUTER APPLY OPENJSON(data.value, '$.services') AS svc
--OUTER APPLY OPENJSON(data.value, '$.forwardDiagnosisICD10') AS diag
OUTER APPLY OPENJSON(data.value, '$.requiredSpecialization') AS spec
WHERE
datasetName = 'Requests';