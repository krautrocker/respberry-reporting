CREATE     VIEW [theRock].[vwAmbulances] AS
SELECT
    --a.ambulanceId,
    --JSON_VALUE(a.jsonString, '$.count') AS count,
    data.code,
    data.phoneNumber,
    CAST(data.name AS nvarchar(50)) AS name
FROM extract.jsonExtract a
CROSS APPLY OPENJSON(a.jsonString, '$.data') 
WITH (
    code NVARCHAR(50),
    phoneNumber NVARCHAR(50),
    name NVARCHAR(255)
) AS data
WHERE
datasetName='Ambulances'