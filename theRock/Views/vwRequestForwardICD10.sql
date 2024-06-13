CREATE             VIEW [theRock].[vwRequestForwardICD10]
AS
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
--svc.value AS serviceId,
CAST(diag.value AS nvarchar(50)) AS icd10DiagnosisId
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.services') AS svc
OUTER APPLY OPENJSON(data.value, '$.forwardDiagnosisICD10') AS diag
WHERE datasetName = 'Requests';