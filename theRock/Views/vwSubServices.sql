CREATE     VIEW [theRock].[vwSubServices] AS
WITH SubServices AS (
    SELECT
	JSON_VALUE(subService.value, '$.name') AS subServiceName,
	JSON_VALUE(subService.value, '$.code') AS subServiceCode
    FROM extract.jsonExtract sg
    OUTER APPLY OPENJSON(sg.jsonString, '$.data') AS data
    OUTER APPLY OPENJSON(data.value, '$.services') AS service
    OUTER APPLY OPENJSON(service.value, '$.services') AS subService
	WHERE
	datasetName='Services'
)
SELECT
subServiceName,
subServiceCode
FROM
SubServices
WHERE
subServiceCode IS NOT NULL
GROUP BY
subServiceName,
subServiceCode;