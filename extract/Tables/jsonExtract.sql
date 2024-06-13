CREATE TABLE [extract].[jsonExtract] (
    [jsonExtractId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [jsonString]    NVARCHAR (MAX) NULL,
    [datasetName]   NVARCHAR (50)  NULL,
    [isActive]      BIT            DEFAULT ((1)) NULL,
    [whoCreated]    NVARCHAR (50)  DEFAULT (suser_name()) NULL,
    [whenCreated]   DATETIME       DEFAULT (getdate()) NULL,
    [whoChanged]    NVARCHAR (50)  NULL,
    [whenChanged]   DATETIME       NULL
);