CREATE TABLE [theRock].[requestFiles] (
    [requestFileId] INT            IDENTITY (1, 1) NOT NULL,
    [requestNumber] NVARCHAR (25)  NULL,
    [filePath]      NVARCHAR (255) NULL,
    [isActive]      BIT            CONSTRAINT [DF__requestFi__isAct__5F94079C] DEFAULT ((1)) NULL,
    [whoCreated]    NVARCHAR (25)  NULL,
    [whenCreated]   DATETIME       CONSTRAINT [DF__requestFi__whenC__60882BD5] DEFAULT (getdate()) NULL,
    [whoChanged]    NVARCHAR (25)  NULL,
    [whenChanged]   DATETIME       NULL
);