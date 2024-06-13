CREATE TABLE [theRock].[Groups] (
    [groupId]     INT           IDENTITY (1, 1) NOT NULL,
    [group]       NVARCHAR (50) NULL,
    [groupName]   NVARCHAR (50) NULL,
    [isActive]    BIT           CONSTRAINT [DF__Groups__isActive__5FFE1BF0] DEFAULT ((1)) NULL,
    [whoCreated]  NVARCHAR (50) CONSTRAINT [DF__Groups__whoCreat__60F24029] DEFAULT (suser_name()) NULL,
    [whenCreated] DATETIME      CONSTRAINT [DF__Groups__whenCrea__61E66462] DEFAULT (getdate()) NULL,
    [whoChanged]  NVARCHAR (50) NULL,
    [whenChanged] DATETIME      NULL,
    CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED ([groupId] ASC)
);