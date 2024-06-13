CREATE     VIEW [theRock].[vwUser]
AS
SELECT
userId,
phoneNumber,
email,
name,
language,
deviceToken
FROM
(
	SELECT
		CAST(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS INT) AS userId,
		data.value AS user_json,
		JSON_VALUE(data.value, '$.phoneNumber') AS phoneNumber,
		JSON_VALUE(data.value, '$.email') AS email,
		JSON_VALUE(data.value, '$.name') AS name,
		JSON_VALUE(data.value, '$.language') AS language,
		JSON_VALUE(data.value, '$.deviceToken') AS deviceToken
	FROM extract.jsonExtract
	CROSS APPLY OPENJSON(jsonString,'$.data') AS data
	WHERE
	datasetName='Users'
) AS BOOP