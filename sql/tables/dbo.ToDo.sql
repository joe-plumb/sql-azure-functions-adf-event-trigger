CREATE TABLE [dbo].[ToDo](
	[JobId] [int] NOT NULL,
	[JobStepId] [int] NOT NULL,
	[JobName] [nvarchar](200) NOT NULL,
	[JobStepName] [nvarchar](200) NOT NULL,
	[JobStepType] [int] NOT NULL,
	[JobStepStatus] [nvarchar](200) NOT NULL,
	[JobMetadata] [nvarchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ToDo] ADD PRIMARY KEY CLUSTERED 
(
	[JobStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO