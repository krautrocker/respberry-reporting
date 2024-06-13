﻿CREATE TABLE [theRock].[Referrals] (
    [referralId]                    INT                IDENTITY (1, 1) NOT NULL,
    [originFacilityCode]            NVARCHAR (50)      NULL,
    [referralNumber]                NVARCHAR (50)      NULL,
    [forwardCaseNumber]             NVARCHAR (50)      NULL,
    [paperFormId]                   NVARCHAR (50)      NULL,
    [referringDoctorName]           NVARCHAR (50)      NULL,
    [nationalIdNumber]              NVARCHAR (50)      NULL,
    [firstName]                     NVARCHAR (50)      NULL,
    [lastName]                      NVARCHAR (50)      NULL,
    [fathersName]                   NVARCHAR (50)      NULL,
    [patientGender]                 NVARCHAR (10)      NULL,
    [visibleDisability]             BIT                NULL,
    [phoneNumber]                   NVARCHAR (50)      NULL,
    [contactName]                   NVARCHAR (50)      NULL,
    [governorate]                   NVARCHAR (50)      NULL,
    [district]                      NVARCHAR (50)      NULL,
    [subdistrict]                   NVARCHAR (50)      NULL,
    [community]                     NVARCHAR (50)      NULL,
    [residentialStatus]             NVARCHAR (50)      NULL,
    [dateOfBirth]                   DATE               NULL,
    [age]                           INT                NULL,
    [ageUnit]                       NVARCHAR (10)      NULL,
    [isUrgent]                      BIT                NULL,
    [referralReason]                NVARCHAR (1500)    NULL,
    [forwardDiagnosis]              NVARCHAR (MAX)     NULL,
    [forwardDiagnosisICD10]         NVARCHAR (MAX)     NULL,
    [otherDiagnosisSupport]         NVARCHAR (1500)    NULL,
    [otherMedicalDevice]            NVARCHAR (1500)    NULL,
    [otherTreatmentOption]          NVARCHAR (1500)    NULL,
    [medicalHistory]                NVARCHAR (MAX)     NULL,
    [clinicalAndMedicalExamination] NVARCHAR (MAX)     NULL,
    [treatmentProvided]             NVARCHAR (MAX)     NULL,
    [recommendations]               NVARCHAR (MAX)     NULL,
    [height]                        INT                NULL,
    [weight]                        INT                NULL,
    [bloodPressure]                 NVARCHAR (50)      NULL,
    [oxygen]                        INT                NULL,
    [heartRate]                     INT                NULL,
    [temperatureInCelsius]          DECIMAL (18, 4)    NULL,
    [status]                        NVARCHAR (50)      NULL,
    [createdAt]                     DATETIMEOFFSET (7) NULL,
    [updatedAt]                     DATETIMEOFFSET (7) NULL,
    [roundedCreatedDate]            DATETIME           NULL,
    [isActive]                      BIT                DEFAULT ((1)) NULL,
    [whoCreated]                    NVARCHAR (50)      DEFAULT (suser_name()) NULL,
    [whenCreated]                   DATETIME           DEFAULT (getdate()) NULL,
    [whoChanged]                    NVARCHAR (50)      NULL,
    [whenChanged]                   DATETIME           NULL,
    CONSTRAINT [PK__Referral__BEBC15E639BE7480] PRIMARY KEY CLUSTERED ([referralId] ASC)
);