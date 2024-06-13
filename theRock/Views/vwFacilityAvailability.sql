CREATE           VIEW [theRock].[vwFacilityAvailability] AS
SELECT
    CAST(ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS int) AS facilityId,
    JSON_VALUE(facility.value, '$.code') AS code,
    JSON_VALUE(facility.value, '$.contact') AS contact,
    JSON_VALUE(facility.value, '$.name') AS name,
    JSON_VALUE(facility.value, '$.type') AS type,
    JSON_VALUE(facility.value, '$.location') AS location,
    JSON_VALUE(availability.value, '$.serviceCode') AS serviceCode,
    CAST(days.DayOfWeek AS nvarchar(50)) AS [DayOfWeek],
    days.IsAvailable AS isAvailable
FROM extract.jsonExtract fa
CROSS APPLY OPENJSON(fa.jsonString, '$.facilities') AS facility
CROSS APPLY OPENJSON(facility.value, '$.availability') AS availability
CROSS APPLY (
    SELECT 'monday' AS DayOfWeek, JSON_VALUE(availability.value, '$.availableDays.monday') AS IsAvailable
    UNION ALL
    SELECT 'tuesday', JSON_VALUE(availability.value, '$.availableDays.tuesday')
    UNION ALL
    SELECT 'wednesday', JSON_VALUE(availability.value, '$.availableDays.wednesday')
    UNION ALL
    SELECT 'thursday', JSON_VALUE(availability.value, '$.availableDays.thursday')
    UNION ALL
    SELECT 'friday', JSON_VALUE(availability.value, '$.availableDays.friday')
    UNION ALL
    SELECT 'saturday', JSON_VALUE(availability.value, '$.availableDays.saturday')
    UNION ALL
    SELECT 'sunday', JSON_VALUE(availability.value, '$.availableDays.sunday')
) AS days (DayOfWeek, IsAvailable)
WHERE
datasetName='Availabilities'