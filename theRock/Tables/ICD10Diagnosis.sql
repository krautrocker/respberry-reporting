CREATE TABLE [theRock].[ICD10Diagnosis] (
    [icd10DiagnosisId]   INT            IDENTITY (1, 1) NOT NULL,
    [icd10DiagnosisCode] NVARCHAR (50)  NULL,
    [icd10DiagnosisName] NVARCHAR (255) NULL,
    [isActive]           BIT            CONSTRAINT [DF__ICD10Diag__isAct__496FBC53] DEFAULT ((1)) NULL,
    [whoCreated]         NVARCHAR (50)  CONSTRAINT [DF__ICD10Diag__whoCr__4A63E08C] DEFAULT (suser_name()) NULL,
    [whenCreated]        DATETIME       CONSTRAINT [DF__ICD10Diag__whenC__4B5804C5] DEFAULT (getdate()) NULL,
    [whoChanged]         NVARCHAR (50)  NULL,
    [whenChanged]        DATETIME       NULL
);