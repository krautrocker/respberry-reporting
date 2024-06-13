CREATE         VIEW [theRock].[vwServiceCatalogue] AS
WITH allServices AS (
    SELECT
	cast(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS INT) AS [groupId],
	JSON_VALUE(data.value, '$.group') AS [group],
	--JSON_VALUE(data.value, '$.name') AS groupName,
	--JSON_VALUE(service.value, '$.name') AS serviceName,
	JSON_VALUE(service.value, '$.code') AS serviceCode,
	--JSON_VALUE(subService.value, '$.name') AS subServiceName,
	JSON_VALUE(subService.value, '$.code') AS subServiceCode
    FROM extract.jsonExtract sg
    OUTER APPLY OPENJSON(sg.jsonString, '$.data') AS data
    OUTER APPLY OPENJSON(data.value, '$.services') AS service
    OUTER APPLY OPENJSON(service.value, '$.services') AS subService
	WHERE
	datasetName='Services'
)
SELECT
groupId,
[group],
--groupName,
--serviceName,
serviceCode,
--subServiceName,
subServiceCode
FROM allServices
GROUP BY
groupId,
[group],
--groupName,
--serviceName,
serviceCode,
--subServiceName,
subServiceCode;