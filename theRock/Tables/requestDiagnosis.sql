CREATE TABLE [theRock].[requestDiagnosis] (
    [requestDiagnosisId]   INT           IDENTITY (1, 1) NOT NULL,
    [forwardDiagnosis]     NVARCHAR (25) NULL,
    [forwardDiagnosisCode] NVARCHAR (50) NULL,
    [isActive]             BIT           NULL,
    [whoCreated]           NVARCHAR (50) DEFAULT (suser_name()) NULL,
    [whenCreated]          DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]           NVARCHAR (50) NULL,
    [whenChanged]          DATETIME      NULL
);