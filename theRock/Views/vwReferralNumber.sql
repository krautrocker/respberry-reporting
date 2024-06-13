CREATE                    VIEW [theRock].[vwReferralNumber] AS

SELECT
referralNumber
FROM
(
	SELECT
	JSON_VALUE(data.value, '$.referralNumber') AS referralNumber
	FROM extract.jsonExtract r
	CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
	WHERE
	datasetName LIKE 'Referrals - Active'
	--GROUP BY
	--JSON_VALUE(data.value, '$.referralNumber')
	UNION
	SELECT
	JSON_VALUE(data.value, '$.referralNumber') AS referralNumber
	FROM extract.jsonExtract r
	CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
	WHERE
	datasetName LIKE 'Referrals - Closed'
	--GROUP BY
	--JSON_VALUE(data.value, '$.referralNumber')
	UNION
	SELECT
	JSON_VALUE(data.value, '$.referralNumber') AS referralNumber
	FROM extract.jsonExtract r
	CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
	WHERE
	datasetName LIKE 'Referrals - In Progress'
	--GROUP BY
	--JSON_VALUE(data.value, '$.referralNumber')
	UNION
	SELECT
	JSON_VALUE(data.value, '$.referralNumber') AS referralNumber
	FROM extract.jsonExtract r
	CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
	WHERE
	datasetName LIKE 'Requests - In Progress'
	--GROUP BY
	--JSON_VALUE(data.value, '$.referralNumber')
	UNION
	SELECT
	JSON_VALUE(data.value, '$.referralNumber') AS referralNumber
	FROM extract.jsonExtract r
	CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
	WHERE
	datasetName LIKE 'Requests - Closed'
	--GROUP BY
	--JSON_VALUE(data.value, '$.referralNumber')
	UNION
	SELECT
	JSON_VALUE(data.value, '$.referralNumber') AS referralNumber
	FROM extract.jsonExtract r
	CROSS APPLY OPENJSON(r.jsonString, '$.data') AS data
	WHERE
	datasetName LIKE 'Requests - Active'
	--GROUP BY
	--JSON_VALUE(data.value, '$.referralNumber')
) AS BOOP
GROUP BY
referralNumber