CREATE VIEW [theRock].[vwActivityHistory]
AS
SELECT
[activityId],
activityCode,
activityDescription,
activityPhaseCode,
activityModeCode,
entityLevelCode,
isUrgent,
isActive,
whoCreated,
whenCreated,
whoChanged,
whenChanged
FROM
theRock.activityHistory