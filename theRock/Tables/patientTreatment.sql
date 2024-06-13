CREATE TABLE [theRock].[patientTreatment] (
    [patientTreatmentId]            INT            IDENTITY (1, 1) NOT NULL,
    [referralNumber]                NVARCHAR (50)  NULL,
    [isPatientArrived]              BIT            NULL,
    [isPatientDeparted]             BIT            NULL,
    [isPatientSentBack]             BIT            NULL,
    [isPatientReturned]             BIT            NULL,
    [destinationTransportationCode] INT            NULL,
    [returnTransportationCode]      INT            NULL,
    [treatmentNote]                 NVARCHAR (MAX) NULL,
    [isActive]                      BIT            DEFAULT ((1)) NULL,
    [whoCreated]                    NVARCHAR (50)  DEFAULT (suser_name()) NULL,
    [whenCreated]                   DATETIME       DEFAULT (getdate()) NULL,
    [whoChanged]                    NVARCHAR (50)  NULL,
    [whenChanged]                   DATETIME       NULL
);