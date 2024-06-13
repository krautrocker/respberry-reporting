CREATE TABLE [theRock].[referralForwardICD10] (
    [referralForwardICD10Id] INT           IDENTITY (1, 1) NOT NULL,
    [referralNumber]         NVARCHAR (25) NULL,
    [icd10DiagnosisId]       INT           NULL,
    [isActive]               BIT           DEFAULT ((1)) NULL,
    [whoCreated]             NVARCHAR (25) NULL,
    [whenCreated]            DATETIME      DEFAULT (getdate()) NULL,
    [whoChanged]             NVARCHAR (25) NULL,
    [whenChanged]            DATETIME      NULL
);