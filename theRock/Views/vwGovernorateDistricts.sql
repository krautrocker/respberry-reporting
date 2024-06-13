CREATE             VIEW [theRock].[vwGovernorateDistricts]
AS
SELECT
    CAST(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS INT) AS governorateId,
    --gov.value AS governorate_json,
    JSON_VALUE(gov.value, '$.name') AS governorate_name,
    --dist.value AS district_json,
    JSON_VALUE(dist.value, '$.name') AS district_name--,
    --subdist.value AS subdistrict_json,
    --JSON_VALUE(subdist.value, '$.name') AS subdistrict_name,
    --comm.value AS community_json,
    --comm.value AS community_name
FROM extract.jsonExtract
CROSS APPLY OPENJSON(jsonString, '$.governorates') AS gov
CROSS APPLY OPENJSON(gov.value, '$.districts') AS dist
--CROSS APPLY OPENJSON(dist.value, '$.subdistricts') AS subdist
--CROSS APPLY OPENJSON(subdist.value, '$.communities') AS comm
WHERE
datasetName='Locations'