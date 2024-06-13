CREATE             VIEW [theRock].[vwDistricts]
AS
SELECT
    --CAST(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS INT) AS governorateDistrictId,
    JSON_VALUE(dist.value, '$.name') AS district_name
FROM extract.jsonExtract
CROSS APPLY OPENJSON(jsonString, '$.governorates') AS gov
CROSS APPLY OPENJSON(gov.value, '$.districts') AS dist
WHERE
datasetName='Locations'
GROUP BY
JSON_VALUE(dist.value, '$.name')