CREATE TABLE [theRock].[referralFiles] (
    [referralFileId] INT            IDENTITY (1, 1) NOT NULL,
    [referralNumber] NVARCHAR (25)  NULL,
    [filePath]       NVARCHAR (255) NULL,
    [isActive]       BIT            CONSTRAINT [DF__referralF__isAct__6641052B] DEFAULT ((1)) NULL,
    [whoCreated]     NVARCHAR (25)  NULL,
    [whenCreated]    DATETIME       CONSTRAINT [DF__referralF__whenC__67352964] DEFAULT (getdate()) NULL,
    [whoChanged]     NVARCHAR (25)  NULL,
    [whenChanged]    DATETIME       NULL
);