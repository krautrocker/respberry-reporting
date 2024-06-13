CREATE             VIEW [theRock].[vwRequestFiles]
AS
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS requestNumber,
CAST([file].value AS nvarchar(255)) AS [filePath]
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.services') AS svc
OUTER APPLY OPENJSON(data.value, '$.forwardDiagnosisICD10') AS diag
OUTER APPLY OPENJSON(data.value, '$.requiredSpecialization') AS spec
OUTER APPLY OPENJSON(data.value, '$.files') AS [file]
WHERE datasetName = 'Requests';