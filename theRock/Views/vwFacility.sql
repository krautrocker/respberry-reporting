CREATE         VIEW [theRock].[vwFacility]
AS
SELECT
    --CAST(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS INT ) AS facilityId,
    --CAST(jsondata.value AS NVARCHAR(MAX)) AS facility_json,
    JSON_VALUE(jsondata.value, '$.code') AS code,
    JSON_VALUE(jsondata.value, '$.contact') AS contact,
    JSON_VALUE(jsondata.value, '$.name') AS name,
    JSON_VALUE(jsondata.value, '$.type') AS type,
    JSON_VALUE(jsondata.value, '$.location') AS location
FROM extract.jsonExtract
CROSS APPLY OPENJSON(jsonString, '$.data') AS jsondata
WHERE
datasetName='Facilities'
GROUP BY
JSON_VALUE(jsondata.value, '$.code'),
JSON_VALUE(jsondata.value, '$.contact'),
JSON_VALUE(jsondata.value, '$.name'),
JSON_VALUE(jsondata.value, '$.type'),
JSON_VALUE(jsondata.value, '$.location')