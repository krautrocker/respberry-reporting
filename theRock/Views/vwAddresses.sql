CREATE           VIEW [theRock].[vwAddresses]
AS
SELECT
    CAST(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS int) AS id,
    --gov.value AS governorate_json,
    CAST(JSON_VALUE(gov.value, '$.name') AS nvarchar(50)) AS governorate_name,
    --dist.value AS district_json,
    CAST(JSON_VALUE(dist.value, '$.name') AS nvarchar(50)) AS district_name,
    --subdist.value AS subdistrict_json,
    CAST(JSON_VALUE(subdist.value, '$.name') AS nvarchar(50)) AS subdistrict_name,
    --comm.value AS community_json,
    CAST(comm.value AS nvarchar(50)) AS community_name
FROM extract.jsonExtract
CROSS APPLY OPENJSON(jsonString, '$.governorates') AS gov
CROSS APPLY OPENJSON(gov.value, '$.districts') AS dist
CROSS APPLY OPENJSON(dist.value, '$.subdistricts') AS subdist
CROSS APPLY OPENJSON(subdist.value, '$.communities') AS comm
WHERE
datasetName='Locations'