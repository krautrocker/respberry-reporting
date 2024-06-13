CREATE     VIEW [theRock].[vwServiceAvailability] AS
SELECT
    --sa.availabilityId,
    JSON_VALUE(data.value, '$.serviceCode') AS serviceCode,
    JSON_VALUE(data.value, '$.isAvailable') AS isAvailable,
    CAST(days.DayOfWeek AS nvarchar(50)) AS [DayOfWeek],
    days.IsAvailable AS DayAvailability
FROM extract.jsonExtract sa
CROSS APPLY OPENJSON(sa.jsonString, '$.data') AS data
CROSS APPLY (
    SELECT 'monday' AS DayOfWeek, JSON_VALUE(data.value, '$.availableDays.monday') AS IsAvailable
    UNION ALL
    SELECT 'tuesday', JSON_VALUE(data.value, '$.availableDays.tuesday')
    UNION ALL
    SELECT 'wednesday', JSON_VALUE(data.value, '$.availableDays.wednesday')
    UNION ALL
    SELECT 'thursday', JSON_VALUE(data.value, '$.availableDays.thursday')
    UNION ALL
    SELECT 'friday', JSON_VALUE(data.value, '$.availableDays.friday')
    UNION ALL
    SELECT 'saturday', JSON_VALUE(data.value, '$.availableDays.saturday')
    UNION ALL
    SELECT 'sunday', JSON_VALUE(data.value, '$.availableDays.sunday')
) AS days (DayOfWeek, IsAvailable)
WHERE
datasetName='Availabilities'