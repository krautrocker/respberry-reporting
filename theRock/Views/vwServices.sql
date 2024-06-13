CREATE     VIEW [theRock].[vwServices] AS
WITH Services AS (
    SELECT
	JSON_VALUE(service.value, '$.name') AS serviceName,
	JSON_VALUE(service.value, '$.code') AS serviceCode
    FROM extract.jsonExtract sg
    OUTER APPLY OPENJSON(sg.jsonString, '$.data') AS data
    OUTER APPLY OPENJSON(data.value, '$.services') AS service
    OUTER APPLY OPENJSON(service.value, '$.services') AS subService
	WHERE
	datasetName='Services'
	GROUP BY
	JSON_VALUE(service.value, '$.name'),
	JSON_VALUE(service.value, '$.code')
)
SELECT
serviceName,
serviceCode
FROM Services