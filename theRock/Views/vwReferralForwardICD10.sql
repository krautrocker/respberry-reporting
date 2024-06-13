CREATE               VIEW [theRock].[vwReferralForwardICD10]
AS
SELECT
JSON_VALUE(data.value, '$.referralNumber') AS referralNumber,
--svc.value AS service,
CAST(diag.value AS nvarchar(MAX)) AS forwardDiagnosisICD10
FROM extract.jsonExtract r
OUTER APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.services') AS svc
OUTER APPLY OPENJSON(data.value, '$.forwardDiagnosisICD10') AS diag
WHERE datasetName = 'Referrals';