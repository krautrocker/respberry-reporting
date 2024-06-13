CREATE       VIEW [theRock].[vwSpecializations] AS
SELECT
CAST(spec.value AS nvarchar(50)) AS specializationCode
FROM extract.jsonExtract r
CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
OUTER APPLY OPENJSON(data.value, '$.requiredSpecialization') AS spec
WHERE datasetName = 'Requests'
GROUP BY
spec.value