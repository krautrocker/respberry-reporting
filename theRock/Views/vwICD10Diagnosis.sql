﻿CREATE VIEW theRock.vwICD10Diagnosis AS
SELECT
icd10DiagnosisCode,
icd10DiagnosisName
FROM
theRock.ICD10Diagnosis
GROUP BY
icd10DiagnosisCode,
icd10DiagnosisName