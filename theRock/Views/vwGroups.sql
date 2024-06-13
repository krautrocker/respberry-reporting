CREATE     VIEW [theRock].[vwGroups] AS
WITH Groups AS (
	SELECT
	JSON_VALUE(data.value, '$.group') AS [group],
	JSON_VALUE(data.value, '$.name') AS groupName
	FROM extract.jsonExtract sg
	OUTER APPLY OPENJSON(sg.jsonString, '$.data') AS data
	OUTER APPLY OPENJSON(data.value, '$.services') AS service
	OUTER APPLY OPENJSON(service.value, '$.services') AS subService
	WHERE
	datasetName='Addresses'
)
SELECT
[group],
groupName
FROM
Groups
GROUP BY
[group],
groupName;