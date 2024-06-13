CREATE         VIEW [theRock].[vwServiceSubServices] AS
WITH serviceSubServices AS (
    SELECT
	JSON_VALUE(service.value, '$.name') AS serviceName,
	JSON_VALUE(service.value, '$.code') AS serviceCode,
	JSON_VALUE(subService.value, '$.name') AS subServiceName,
	JSON_VALUE(subService.value, '$.code') AS subServiceCode
    FROM extract.jsonExtract sg
    OUTER APPLY OPENJSON(sg.jsonString, '$.data') AS data
    OUTER APPLY OPENJSON(data.value, '$.services') AS service
    OUTER APPLY OPENJSON(service.value, '$.services') AS subService
	WHERE
	datasetName='Services'
	GROUP BY
	JSON_VALUE(service.value, '$.name'),
	JSON_VALUE(service.value, '$.code'),
	JSON_VALUE(subService.value, '$.name'),
	JSON_VALUE(subService.value, '$.code')
)
SELECT
serviceName,
serviceCode,
subServiceName,
subServiceCode
FROM
serviceSubServices