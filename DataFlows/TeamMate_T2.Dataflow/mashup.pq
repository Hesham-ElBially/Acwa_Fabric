[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProcedureWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProcedureWorkflowHistoryId", DestinationColumnName = "ProcedureWorkflowHistoryId"], [SourceColumnName = "ProcedureId", DestinationColumnName = "ProcedureId"], [SourceColumnName = "ProcedureTitle", DestinationColumnName = "ProcedureTitle"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "ReviewSequence", DestinationColumnName = "ReviewSequence"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProcedureWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProcedureWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProjectPhaseMilestones_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectPhaseMilestoneId", DestinationColumnName = "ProjectPhaseMilestoneId"], [SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "MilestoneName", DestinationColumnName = "MilestoneName"], [SourceColumnName = "PhaseName", DestinationColumnName = "PhaseName"], [SourceColumnName = "IsActive", DestinationColumnName = "IsActive"], [SourceColumnName = "RevisedDueDate", DestinationColumnName = "RevisedDueDate"], [SourceColumnName = "EstimatedEndDate", DestinationColumnName = "EstimatedEndDate"], [SourceColumnName = "ActualEndDate", DestinationColumnName = "ActualEndDate"], [SourceColumnName = "SortOrder", DestinationColumnName = "SortOrder"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProjectPhaseMilestones = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProjectPhaseMilestones", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProjectPhases_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectPhaseName", DestinationColumnName = "ProjectPhaseName"], [SourceColumnName = "SortOrder", DestinationColumnName = "SortOrder"], [SourceColumnName = "EstStartDate", DestinationColumnName = "EstStartDate"], [SourceColumnName = "EstEndDate", DestinationColumnName = "EstEndDate"], [SourceColumnName = "ActStartDate", DestinationColumnName = "ActStartDate"], [SourceColumnName = "ActEndDate", DestinationColumnName = "ActEndDate"], [SourceColumnName = "IsActive", DestinationColumnName = "IsActive"], [SourceColumnName = "EstHours", DestinationColumnName = "EstHours"], [SourceColumnName = "ActHours", DestinationColumnName = "ActHours"], [SourceColumnName = "IsComplete", DestinationColumnName = "IsComplete"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "RevisedDueDate", DestinationColumnName = "RevisedDueDate"], [SourceColumnName = "ReviewDueDate", DestinationColumnName = "ReviewDueDate"], [SourceColumnName = "ScheduledStartDate", DestinationColumnName = "ScheduledStartDate"], [SourceColumnName = "ScheduledEndDate", DestinationColumnName = "ScheduledEndDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProjectPhases = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProjectPhases", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProjectPhaseWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectPhaseWorkflowHistoryId", DestinationColumnName = "ProjectPhaseWorkflowHistoryId"], [SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "ProjectPhaseName", DestinationColumnName = "ProjectPhaseName"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectTitle", DestinationColumnName = "ProjectTitle"], [SourceColumnName = "ProjectCode", DestinationColumnName = "ProjectCode"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProjectPhaseWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProjectPhaseWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Projects_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectTitle", DestinationColumnName = "ProjectTitle"], [SourceColumnName = "ProjectCode", DestinationColumnName = "ProjectCode"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "LocationCategoryId", DestinationColumnName = "LocationCategoryId"], [SourceColumnName = "LocationCategory", DestinationColumnName = "LocationCategory"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category9Id", DestinationColumnName = "Category9Id"], [SourceColumnName = "Category9", DestinationColumnName = "Category9"], [SourceColumnName = "Category10Id", DestinationColumnName = "Category10Id"], [SourceColumnName = "Category10", DestinationColumnName = "Category10"], [SourceColumnName = "Category11Id", DestinationColumnName = "Category11Id"], [SourceColumnName = "Category11", DestinationColumnName = "Category11"], [SourceColumnName = "Category12Id", DestinationColumnName = "Category12Id"], [SourceColumnName = "Category12", DestinationColumnName = "Category12"], [SourceColumnName = "Category13Id", DestinationColumnName = "Category13Id"], [SourceColumnName = "Category13", DestinationColumnName = "Category13"], [SourceColumnName = "RiskCategoryId", DestinationColumnName = "RiskCategoryId"], [SourceColumnName = "RiskCategory", DestinationColumnName = "RiskCategory"], [SourceColumnName = "FinalRiskCategoryId", DestinationColumnName = "FinalRiskCategoryId"], [SourceColumnName = "FinalRiskCategory", DestinationColumnName = "FinalRiskCategory"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "MultiSelectCategory7Id", DestinationColumnName = "MultiSelectCategory7Id"], [SourceColumnName = "MultiSelectCategory7", DestinationColumnName = "MultiSelectCategory7"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "NumericValue5", DestinationColumnName = "NumericValue5"], [SourceColumnName = "NumericValue6", DestinationColumnName = "NumericValue6"], [SourceColumnName = "NumericValue7", DestinationColumnName = "NumericValue7"], [SourceColumnName = "EstimatedStartDate", DestinationColumnName = "EstimatedStartDate"], [SourceColumnName = "EstimatedEndDate", DestinationColumnName = "EstimatedEndDate"], [SourceColumnName = "ActualStartDate", DestinationColumnName = "ActualStartDate"], [SourceColumnName = "ActualEndDate", DestinationColumnName = "ActualEndDate"], [SourceColumnName = "Date1", DestinationColumnName = "Date1"], [SourceColumnName = "Date2", DestinationColumnName = "Date2"], [SourceColumnName = "Date3", DestinationColumnName = "Date3"], [SourceColumnName = "Date4", DestinationColumnName = "Date4"], [SourceColumnName = "Date5", DestinationColumnName = "Date5"], [SourceColumnName = "Date6", DestinationColumnName = "Date6"], [SourceColumnName = "EstimatedHours", DestinationColumnName = "EstimatedHours"], [SourceColumnName = "ActualHours", DestinationColumnName = "ActualHours"], [SourceColumnName = "EstimatedResourceCosts", DestinationColumnName = "EstimatedResourceCosts"], [SourceColumnName = "ActualResourceCosts", DestinationColumnName = "ActualResourceCosts"], [SourceColumnName = "EstimatedExternalCosts", DestinationColumnName = "EstimatedExternalCosts"], [SourceColumnName = "ActualExternalCosts", DestinationColumnName = "ActualExternalCosts"], [SourceColumnName = "EstimatedExpenses", DestinationColumnName = "EstimatedExpenses"], [SourceColumnName = "ActualExpenses", DestinationColumnName = "ActualExpenses"], [SourceColumnName = "ProjectStateId", DestinationColumnName = "ProjectStateId"], [SourceColumnName = "ProjectState", DestinationColumnName = "ProjectState"], [SourceColumnName = "CurrentProjectPhaseValue", DestinationColumnName = "CurrentProjectPhaseValue"], [SourceColumnName = "CurrentProjectPhaseMilestoneValue", DestinationColumnName = "CurrentProjectPhaseMilestoneValue"], [SourceColumnName = "CombinedTotalHours", DestinationColumnName = "CombinedTotalHours"], [SourceColumnName = "CompletedDate", DestinationColumnName = "CompletedDate"], [SourceColumnName = "ScheduledStartDate", DestinationColumnName = "ScheduledStartDate"], [SourceColumnName = "ScheduledEndDate", DestinationColumnName = "ScheduledEndDate"], [SourceColumnName = "ActiveAuditPlanId", DestinationColumnName = "ActiveAuditPlanId"], [SourceColumnName = "ActiveAuditPlanTitle", DestinationColumnName = "ActiveAuditPlanTitle"], [SourceColumnName = "ProjectApprovalStateId", DestinationColumnName = "ProjectApprovalStateId"], [SourceColumnName = "ProjectApprovalState", DestinationColumnName = "ProjectApprovalState"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "YesNo3", DestinationColumnName = "YesNo3"], [SourceColumnName = "YesNo4", DestinationColumnName = "YesNo4"], [SourceColumnName = "YesNo5", DestinationColumnName = "YesNo5"], [SourceColumnName = "IsMigrated", DestinationColumnName = "IsMigrated"], [SourceColumnName = "IsOfflineMergeEnabled", DestinationColumnName = "IsOfflineMergeEnabled"], [SourceColumnName = "ExcludeAssessmentObjects", DestinationColumnName = "ExcludeAssessmentObjects"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Projects = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Projects", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProjectTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"], [SourceColumnName = "Text8", DestinationColumnName = "Text8"], [SourceColumnName = "Text9", DestinationColumnName = "Text9"], [SourceColumnName = "Text10", DestinationColumnName = "Text10"], [SourceColumnName = "Text11", DestinationColumnName = "Text11"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProjectTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProjectTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Recommendations_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "RecommendationTitle", DestinationColumnName = "RecommendationTitle"], [SourceColumnName = "RecommendationCode", DestinationColumnName = "RecommendationCode"], [SourceColumnName = "RecommendationStateId", DestinationColumnName = "RecommendationStateId"], [SourceColumnName = "RecommendationState", DestinationColumnName = "RecommendationState"], [SourceColumnName = "RecommendationStateSubActionId", DestinationColumnName = "RecommendationStateSubActionId"], [SourceColumnName = "RecommendationStateSubAction", DestinationColumnName = "RecommendationStateSubAction"], [SourceColumnName = "PriorityCategoryId", DestinationColumnName = "PriorityCategoryId"], [SourceColumnName = "PriorityCategory", DestinationColumnName = "PriorityCategory"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "YesNo3", DestinationColumnName = "YesNo3"], [SourceColumnName = "YesNo4", DestinationColumnName = "YesNo4"], [SourceColumnName = "YesNo5", DestinationColumnName = "YesNo5"], [SourceColumnName = "YesNo6", DestinationColumnName = "YesNo6"], [SourceColumnName = "YesNo7", DestinationColumnName = "YesNo7"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "RecommendationStatusId", DestinationColumnName = "RecommendationStatusId"], [SourceColumnName = "RecommendationStatus", DestinationColumnName = "RecommendationStatus"], [SourceColumnName = "LastStatusUpdate", DestinationColumnName = "LastStatusUpdate"], [SourceColumnName = "LastStatusUpdateUserId", DestinationColumnName = "LastStatusUpdateUserId"], [SourceColumnName = "LastStatusUpdateUser", DestinationColumnName = "LastStatusUpdateUser"], [SourceColumnName = "LastStatusUpdateDate", DestinationColumnName = "LastStatusUpdateDate"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category9Id", DestinationColumnName = "Category9Id"], [SourceColumnName = "Category9", DestinationColumnName = "Category9"], [SourceColumnName = "Category10Id", DestinationColumnName = "Category10Id"], [SourceColumnName = "Category10", DestinationColumnName = "Category10"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "NumericValue5", DestinationColumnName = "NumericValue5"], [SourceColumnName = "NumericValue6", DestinationColumnName = "NumericValue6"], [SourceColumnName = "NumericValue7", DestinationColumnName = "NumericValue7"], [SourceColumnName = "NumericValue8", DestinationColumnName = "NumericValue8"], [SourceColumnName = "NumericValue9", DestinationColumnName = "NumericValue9"], [SourceColumnName = "NumericValue10", DestinationColumnName = "NumericValue10"], [SourceColumnName = "NumericValue11", DestinationColumnName = "NumericValue11"], [SourceColumnName = "NumericValue12", DestinationColumnName = "NumericValue12"], [SourceColumnName = "Date1", DestinationColumnName = "Date1"], [SourceColumnName = "Date2", DestinationColumnName = "Date2"], [SourceColumnName = "Date3", DestinationColumnName = "Date3"], [SourceColumnName = "Date4", DestinationColumnName = "Date4"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "ActualDate", DestinationColumnName = "ActualDate"], [SourceColumnName = "CreatedDate", DestinationColumnName = "CreatedDate"], [SourceColumnName = "ReviewDueDate", DestinationColumnName = "ReviewDueDate"], [SourceColumnName = "RevisedDueDate", DestinationColumnName = "RevisedDueDate"], [SourceColumnName = "ActualClosedDate", DestinationColumnName = "ActualClosedDate"], [SourceColumnName = "ActualCreatedDate", DestinationColumnName = "ActualCreatedDate"], [SourceColumnName = "ActualImplementationDate", DestinationColumnName = "ActualImplementationDate"], [SourceColumnName = "ResponseDueDate", DestinationColumnName = "ResponseDueDate"], [SourceColumnName = "LastNotStartedLabel", DestinationColumnName = "LastNotStartedLabel"], [SourceColumnName = "LastNotStartedUserId", DestinationColumnName = "LastNotStartedUserId"], [SourceColumnName = "LastNotStartedUser", DestinationColumnName = "LastNotStartedUser"], [SourceColumnName = "LastNotStartedDate", DestinationColumnName = "LastNotStartedDate"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastImplementedLabel", DestinationColumnName = "LastImplementedLabel"], [SourceColumnName = "LastImplementedUserId", DestinationColumnName = "LastImplementedUserId"], [SourceColumnName = "LastImplementedUser", DestinationColumnName = "LastImplementedUser"], [SourceColumnName = "LastImplementedDate", DestinationColumnName = "LastImplementedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"], [SourceColumnName = "LastReviewedSubActionId", DestinationColumnName = "LastReviewedSubActionId"], [SourceColumnName = "LastReviewedSubActionLabel", DestinationColumnName = "LastReviewedSubActionLabel"], [SourceColumnName = "LastClosedLabel", DestinationColumnName = "LastClosedLabel"], [SourceColumnName = "LastClosedUserId", DestinationColumnName = "LastClosedUserId"], [SourceColumnName = "LastClosedUser", DestinationColumnName = "LastClosedUser"], [SourceColumnName = "LastClosedDate", DestinationColumnName = "LastClosedDate"], [SourceColumnName = "LastClosedSubActionId", DestinationColumnName = "LastClosedSubActionId"], [SourceColumnName = "LastClosedSubActionLabel", DestinationColumnName = "LastClosedSubActionLabel"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"], [SourceColumnName = "TeamStoreRecommendationID", DestinationColumnName = "TeamStoreRecommendationID"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Recommendations = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Recommendations", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastNotStartedDate", type date}, {"LastInProgressDate", type date}, {"LastImplementedDate", type date}, {"LastReviewedDate", type date}, {"LastClosedDate", type date}, {"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RecommendationStatusUpdates_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RecommendationStatusUpdateId", DestinationColumnName = "RecommendationStatusUpdateId"], [SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "RecommendationTitle", DestinationColumnName = "RecommendationTitle"], [SourceColumnName = "StatusUpdateComment", DestinationColumnName = "StatusUpdateComment"], [SourceColumnName = "StatusUpdateDate", DestinationColumnName = "StatusUpdateDate"], [SourceColumnName = "CreatedUserId", DestinationColumnName = "CreatedUserId"], [SourceColumnName = "CreatedUserName", DestinationColumnName = "CreatedUserName"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RecommendationStatusUpdates = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RecommendationStatusUpdates", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RecommendationTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"], [SourceColumnName = "Text8", DestinationColumnName = "Text8"], [SourceColumnName = "Text9", DestinationColumnName = "Text9"], [SourceColumnName = "Text10", DestinationColumnName = "Text10"], [SourceColumnName = "Text11", DestinationColumnName = "Text11"], [SourceColumnName = "Text12", DestinationColumnName = "Text12"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RecommendationTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RecommendationTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RecommendationWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RecommendationWorkflowHistoryId", DestinationColumnName = "RecommendationWorkflowHistoryId"], [SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "RecommendationTitle", DestinationColumnName = "RecommendationTitle"], [SourceColumnName = "RecommendationCode", DestinationColumnName = "RecommendationCode"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "ReviewSequence", DestinationColumnName = "ReviewSequence"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RecommendationWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RecommendationWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Risks_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "RiskTitle", DestinationColumnName = "RiskTitle"], [SourceColumnName = "RiskCode", DestinationColumnName = "RiskCode"], [SourceColumnName = "RiskStateId", DestinationColumnName = "RiskStateId"], [SourceColumnName = "RiskState", DestinationColumnName = "RiskState"], [SourceColumnName = "RiskStateSubActionId", DestinationColumnName = "RiskStateSubActionId"], [SourceColumnName = "RiskStateSubAction", DestinationColumnName = "RiskStateSubAction"], [SourceColumnName = "Weight", DestinationColumnName = "Weight"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "ReviewDueDate", DestinationColumnName = "ReviewDueDate"], [SourceColumnName = "IsStrategic", DestinationColumnName = "IsStrategic"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "LastNotStartedLabel", DestinationColumnName = "LastNotStartedLabel"], [SourceColumnName = "LastNotStartedUserId", DestinationColumnName = "LastNotStartedUserId"], [SourceColumnName = "LastNotStartedUser", DestinationColumnName = "LastNotStartedUser"], [SourceColumnName = "LastNotStartedDate", DestinationColumnName = "LastNotStartedDate"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastCompletedLabel", DestinationColumnName = "LastCompletedLabel"], [SourceColumnName = "LastCompletedUserId", DestinationColumnName = "LastCompletedUserId"], [SourceColumnName = "LastCompletedUser", DestinationColumnName = "LastCompletedUser"], [SourceColumnName = "LastCompletedDate", DestinationColumnName = "LastCompletedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"], [SourceColumnName = "LastReviewedSubActionId", DestinationColumnName = "LastReviewedSubActionId"], [SourceColumnName = "LastReviewedSubActionLabel", DestinationColumnName = "LastReviewedSubActionLabel"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "TeamStoreRiskId", DestinationColumnName = "TeamStoreRiskId"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Risks = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Risks", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastNotStartedDate", type date}, {"LastInProgressDate", type date}, {"LastCompletedDate", type date}, {"LastReviewedDate", type date}, {"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RiskScoringCalculations_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskScoringCalculatedId", DestinationColumnName = "RiskScoringCalculatedId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "RiskTitle", DestinationColumnName = "RiskTitle"], [SourceColumnName = "CalculatedScoreType", DestinationColumnName = "CalculatedScoreType"], [SourceColumnName = "CalculatedScoreValue", DestinationColumnName = "CalculatedScoreValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RiskScoringCalculations = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RiskScoringCalculations", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RiskScoringCalculationsAssessmentProject_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskScoringCalculatedId", DestinationColumnName = "RiskScoringCalculatedId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "RiskTitle", DestinationColumnName = "RiskTitle"], [SourceColumnName = "CalculatedScoreType", DestinationColumnName = "CalculatedScoreType"], [SourceColumnName = "CalculatedScoreValue", DestinationColumnName = "CalculatedScoreValue"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RiskScoringCalculationsAssessmentProject = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RiskScoringCalculationsAssessmentProject", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RiskScoringValues_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskScoreId", DestinationColumnName = "RiskScoreId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "RiskTitle", DestinationColumnName = "RiskTitle"], [SourceColumnName = "VariableId", DestinationColumnName = "VariableId"], [SourceColumnName = "VariableTitle", DestinationColumnName = "VariableTitle"], [SourceColumnName = "MetricTitle", DestinationColumnName = "MetricTitle"], [SourceColumnName = "ScoreType", DestinationColumnName = "ScoreType"], [SourceColumnName = "ScoreLabel", DestinationColumnName = "ScoreLabel"], [SourceColumnName = "ScoreValue", DestinationColumnName = "ScoreValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RiskScoringValues = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RiskScoringValues", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RiskScoringValuesAssessmentProject_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskScoreId", DestinationColumnName = "RiskScoreId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "RiskTitle", DestinationColumnName = "RiskTitle"], [SourceColumnName = "VariableId", DestinationColumnName = "VariableId"], [SourceColumnName = "VariableTitle", DestinationColumnName = "VariableTitle"], [SourceColumnName = "MetricTitle", DestinationColumnName = "MetricTitle"], [SourceColumnName = "ScoreType", DestinationColumnName = "ScoreType"], [SourceColumnName = "ScoreLabel", DestinationColumnName = "ScoreLabel"], [SourceColumnName = "ScoreValue", DestinationColumnName = "ScoreValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RiskScoringValuesAssessmentProject = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RiskScoringValuesAssessmentProject", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RiskTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RiskTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RiskTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "RiskWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "RiskWorkflowHistoryId", DestinationColumnName = "RiskWorkflowHistoryId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "RiskTitle", DestinationColumnName = "RiskTitle"], [SourceColumnName = "RiskCode", DestinationColumnName = "RiskCode"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "ReviewSequence", DestinationColumnName = "ReviewSequence"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared RiskWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "RiskWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SecurityAssignments_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SecurityAssignmentId", DestinationColumnName = "SecurityAssignmentId"], [SourceColumnName = "AssesmentContextId", DestinationColumnName = "AssesmentContextId"], [SourceColumnName = "ProjectContextId", DestinationColumnName = "ProjectContextId"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "EntityId", DestinationColumnName = "EntityId"], [SourceColumnName = "IssueId", DestinationColumnName = "IssueId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "ControlId", DestinationColumnName = "ControlId"], [SourceColumnName = "ProcedureId", DestinationColumnName = "ProcedureId"], [SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "ObjectiveId", DestinationColumnName = "ObjectiveId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "AuditReportId", DestinationColumnName = "AuditReportId"], [SourceColumnName = "CoachingNoteId", DestinationColumnName = "CoachingNoteId"], [SourceColumnName = "WorkpaperId", DestinationColumnName = "WorkpaperId"], [SourceColumnName = "FolderId", DestinationColumnName = "FolderId"], [SourceColumnName = "RoleId", DestinationColumnName = "RoleId"], [SourceColumnName = "RoleTitle", DestinationColumnName = "RoleTitle"], [SourceColumnName = "AssignedUserId", DestinationColumnName = "AssignedUserId"], [SourceColumnName = "AssignedUserName", DestinationColumnName = "AssignedUserName"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SecurityAssignments = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SecurityAssignments", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SecurityAssignmentsAggregated_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SecurityAssignmentsAggregatedId", DestinationColumnName = "SecurityAssignmentsAggregatedId"], [SourceColumnName = "AssesmentContextId", DestinationColumnName = "AssesmentContextId"], [SourceColumnName = "ProjectContextId", DestinationColumnName = "ProjectContextId"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "EntityId", DestinationColumnName = "EntityId"], [SourceColumnName = "IssueId", DestinationColumnName = "IssueId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "ControlId", DestinationColumnName = "ControlId"], [SourceColumnName = "ProcedureId", DestinationColumnName = "ProcedureId"], [SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "ObjectiveId", DestinationColumnName = "ObjectiveId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "AuditReportId", DestinationColumnName = "AuditReportId"], [SourceColumnName = "CoachingNoteId", DestinationColumnName = "CoachingNoteId"], [SourceColumnName = "WorkpaperId", DestinationColumnName = "WorkpaperId"], [SourceColumnName = "FolderId", DestinationColumnName = "FolderId"], [SourceColumnName = "RoleId", DestinationColumnName = "RoleId"], [SourceColumnName = "RoleTitle", DestinationColumnName = "RoleTitle"], [SourceColumnName = "AssignedUserNames", DestinationColumnName = "AssignedUserNames"], [SourceColumnName = "DirectAssignedUserNames", DestinationColumnName = "DirectAssignedUserNames"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SecurityAssignmentsAggregated = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SecurityAssignmentsAggregated", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SelfAssessmentControls_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SelfAssessmentControlId", DestinationColumnName = "SelfAssessmentControlId"], [SourceColumnName = "SelfAssessmentItemId", DestinationColumnName = "SelfAssessmentItemId"], [SourceColumnName = "ControlId", DestinationColumnName = "ControlId"], [SourceColumnName = "SelfAssessmentControlTitle", DestinationColumnName = "SelfAssessmentControlTitle"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SelfAssessmentStateId", DestinationColumnName = "SelfAssessmentStateId"], [SourceColumnName = "SelfAssessmentState", DestinationColumnName = "SelfAssessmentState"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "BusinessContactUserID", DestinationColumnName = "BusinessContactUserID"], [SourceColumnName = "BusinessContactUserName", DestinationColumnName = "BusinessContactUserName"], [SourceColumnName = "BusinessReviewerUserNames", DestinationColumnName = "BusinessReviewerUserNames"], [SourceColumnName = "ControlTitle", DestinationColumnName = "ControlTitle"], [SourceColumnName = "ParentEntityId", DestinationColumnName = "ParentEntityId"], [SourceColumnName = "ParentEntityTitle", DestinationColumnName = "ParentEntityTitle"], [SourceColumnName = "NumberIssuesAdded", DestinationColumnName = "NumberIssuesAdded"], [SourceColumnName = "NumberWorkpapersAdded", DestinationColumnName = "NumberWorkpapersAdded"], [SourceColumnName = "IsEditted", DestinationColumnName = "IsEditted"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastCompletedLabel", DestinationColumnName = "LastCompletedLabel"], [SourceColumnName = "LastCompletedUserId", DestinationColumnName = "LastCompletedUserId"], [SourceColumnName = "LastCompletedUser", DestinationColumnName = "LastCompletedUser"], [SourceColumnName = "LastCompletedDate", DestinationColumnName = "LastCompletedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SelfAssessmentControls = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SelfAssessmentControls", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastInProgressDate", type date}, {"LastCompletedDate", type date}, {"LastReviewedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SelfAssessmentEntitys_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SelfAssessmentEntityId", DestinationColumnName = "SelfAssessmentEntityId"], [SourceColumnName = "SelfAssessmentItemId", DestinationColumnName = "SelfAssessmentItemId"], [SourceColumnName = "EntityId", DestinationColumnName = "EntityId"], [SourceColumnName = "SelfAssessmentEntityTitle", DestinationColumnName = "SelfAssessmentEntityTitle"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SelfAssessmentStateId", DestinationColumnName = "SelfAssessmentStateId"], [SourceColumnName = "SelfAssessmentState", DestinationColumnName = "SelfAssessmentState"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "BusinessContactUserID", DestinationColumnName = "BusinessContactUserID"], [SourceColumnName = "BusinessContactUserName", DestinationColumnName = "BusinessContactUserName"], [SourceColumnName = "BusinessReviewerUserNames", DestinationColumnName = "BusinessReviewerUserNames"], [SourceColumnName = "EntityTitle", DestinationColumnName = "EntityTitle"], [SourceColumnName = "ParentEntityId", DestinationColumnName = "ParentEntityId"], [SourceColumnName = "ParentEntityTitle", DestinationColumnName = "ParentEntityTitle"], [SourceColumnName = "NumberWorkpapersAdded", DestinationColumnName = "NumberWorkpapersAdded"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastCompletedLabel", DestinationColumnName = "LastCompletedLabel"], [SourceColumnName = "LastCompletedUserId", DestinationColumnName = "LastCompletedUserId"], [SourceColumnName = "LastCompletedUser", DestinationColumnName = "LastCompletedUser"], [SourceColumnName = "LastCompletedDate", DestinationColumnName = "LastCompletedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SelfAssessmentEntitys = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SelfAssessmentEntitys", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastInProgressDate", type date}, {"LastCompletedDate", type date}, {"LastReviewedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SelfAssessmentItemWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SelfAssessmentItemWorkflowHistoryId", DestinationColumnName = "SelfAssessmentItemWorkflowHistoryId"], [SourceColumnName = "SelfAssessmentItemId", DestinationColumnName = "SelfAssessmentItemId"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SelfAssessmentTitle", DestinationColumnName = "SelfAssessmentTitle"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SelfAssessmentItemWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SelfAssessmentItemWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SelfAssessmentRisks_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SelfAssessmentStrategicRiskId", DestinationColumnName = "SelfAssessmentStrategicRiskId"], [SourceColumnName = "SelfAssessmentItemId", DestinationColumnName = "SelfAssessmentItemId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "SelfAssessmentStrategicRiskTitle", DestinationColumnName = "SelfAssessmentStrategicRiskTitle"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SelfAssessmentStateId", DestinationColumnName = "SelfAssessmentStateId"], [SourceColumnName = "SelfAssessmentState", DestinationColumnName = "SelfAssessmentState"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "BusinessContactUserID", DestinationColumnName = "BusinessContactUserID"], [SourceColumnName = "BusinessContactUserName", DestinationColumnName = "BusinessContactUserName"], [SourceColumnName = "BusinessReviewerUserNames", DestinationColumnName = "BusinessReviewerUserNames"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "ParentEntityId", DestinationColumnName = "ParentEntityId"], [SourceColumnName = "ParentEntityTitle", DestinationColumnName = "ParentEntityTitle"], [SourceColumnName = "NumberIssuesAdded", DestinationColumnName = "NumberIssuesAdded"], [SourceColumnName = "NumberWorkpapersAdded", DestinationColumnName = "NumberWorkpapersAdded"], [SourceColumnName = "IsEditted", DestinationColumnName = "IsEditted"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastCompletedLabel", DestinationColumnName = "LastCompletedLabel"], [SourceColumnName = "LastCompletedUserId", DestinationColumnName = "LastCompletedUserId"], [SourceColumnName = "LastCompletedUser", DestinationColumnName = "LastCompletedUser"], [SourceColumnName = "LastCompletedDate", DestinationColumnName = "LastCompletedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SelfAssessmentRisks = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SelfAssessmentRisks", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastInProgressDate", type date}, {"LastCompletedDate", type date}, {"LastReviewedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SelfAssessments_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SelfAssessmentTitle", DestinationColumnName = "SelfAssessmentTitle"], [SourceColumnName = "SelfAssessmentTypeId", DestinationColumnName = "SelfAssessmentTypeId"], [SourceColumnName = "SelfAssessmentTypeName", DestinationColumnName = "SelfAssessmentTypeName"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "SurveyTemplateId", DestinationColumnName = "SurveyTemplateId"], [SourceColumnName = "SurveyTemplateName", DestinationColumnName = "SurveyTemplateName"], [SourceColumnName = "StartDate", DestinationColumnName = "StartDate"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "QuarterCID", DestinationColumnName = "QuarterCID"], [SourceColumnName = "QuarterCIDValue", DestinationColumnName = "QuarterCIDValue"], [SourceColumnName = "IsPublished", DestinationColumnName = "IsPublished"], [SourceColumnName = "HasAttachments", DestinationColumnName = "HasAttachments"], [SourceColumnName = "HasIssues", DestinationColumnName = "HasIssues"], [SourceColumnName = "IsConsolidated", DestinationColumnName = "IsConsolidated"], [SourceColumnName = "AllowControlEdit", DestinationColumnName = "AllowControlEdit"], [SourceColumnName = "TrackControlChanges", DestinationColumnName = "TrackControlChanges"], [SourceColumnName = "EntityDisplayControls", DestinationColumnName = "EntityDisplayControls"], [SourceColumnName = "PushControlChangesToTS", DestinationColumnName = "PushControlChangesToTS"], [SourceColumnName = "DisplayScore", DestinationColumnName = "DisplayScore"], [SourceColumnName = "BusinessContactAssignmentTypeId", DestinationColumnName = "BusinessContactAssignmentTypeId"], [SourceColumnName = "BusinessContactAssignmentTypeName", DestinationColumnName = "BusinessContactAssignmentTypeName"], [SourceColumnName = "ReviewerAssignmentTypeId", DestinationColumnName = "ReviewerAssignmentTypeId"], [SourceColumnName = "ReviewerAssignmentTypeName", DestinationColumnName = "ReviewerAssignmentTypeName"], [SourceColumnName = "SelfAssessmentPeriodId", DestinationColumnName = "SelfAssessmentPeriodId"], [SourceColumnName = "SelfAssessmentPeriod", DestinationColumnName = "SelfAssessmentPeriod"], [SourceColumnName = "StrategicRiskSAPeriodId", DestinationColumnName = "StrategicRiskSAPeriodId"], [SourceColumnName = "StrategicRiskSAPeriod", DestinationColumnName = "StrategicRiskSAPeriod"], [SourceColumnName = "BusinessContactRoleId", DestinationColumnName = "BusinessContactRoleId"], [SourceColumnName = "BusinessContactRoleTitle", DestinationColumnName = "BusinessContactRoleTitle"], [SourceColumnName = "BusinessReviewerRoleId", DestinationColumnName = "BusinessReviewerRoleId"], [SourceColumnName = "BusinessReviewerRoleTitle", DestinationColumnName = "BusinessReviewerRoleTitle"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SelfAssessments = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SelfAssessments", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sprints_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SprintId", DestinationColumnName = "SprintId"], [SourceColumnName = "SprintName", DestinationColumnName = "SprintName"], [SourceColumnName = "SprintStartDate", DestinationColumnName = "SprintStartDate"], [SourceColumnName = "SprintEndDate", DestinationColumnName = "SprintEndDate"], [SourceColumnName = "SprintStateId", DestinationColumnName = "SprintStateId"], [SourceColumnName = "Goal", DestinationColumnName = "Goal"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Sprints = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Sprints", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SprintStates_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SprintStateId", DestinationColumnName = "SprintStateId"], [SourceColumnName = "SprintStateName", DestinationColumnName = "SprintStateName"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SprintStates = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SprintStates", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Stories_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StoryId", DestinationColumnName = "StoryId"], [SourceColumnName = "StoryTitle", DestinationColumnName = "StoryTitle"], [SourceColumnName = "StoryCode", DestinationColumnName = "StoryCode"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "SprintId", DestinationColumnName = "SprintId"], [SourceColumnName = "StoryStateId", DestinationColumnName = "StoryStateId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Stories = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Stories", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryFieldDefinitions_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "FieldDefinitionId", DestinationColumnName = "FieldDefinitionId"], [SourceColumnName = "FieldDefinitionName", DestinationColumnName = "FieldDefinitionName"], [SourceColumnName = "FieldDefinitionLabel", DestinationColumnName = "FieldDefinitionLabel"], [SourceColumnName = "Description", DestinationColumnName = "Description"], [SourceColumnName = "DbDataType", DestinationColumnName = "DbDataType"], [SourceColumnName = "DbDataLength", DestinationColumnName = "DbDataLength"], [SourceColumnName = "FieldDefinitionType", DestinationColumnName = "FieldDefinitionType"], [SourceColumnName = "FieldType", DestinationColumnName = "FieldType"], [SourceColumnName = "FieldLookupListId", DestinationColumnName = "FieldLookupListId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryFieldDefinitions = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryFieldDefinitions", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryFieldValues_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StoryFieldValueId", DestinationColumnName = "StoryFieldValueId"], [SourceColumnName = "StoryId", DestinationColumnName = "StoryId"], [SourceColumnName = "FieldDefinitionId", DestinationColumnName = "FieldDefinitionId"], [SourceColumnName = "FieldValue", DestinationColumnName = "FieldValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryFieldValues = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryFieldValues", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryFieldValueTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StoryFieldValueId", DestinationColumnName = "StoryFieldValueId"], [SourceColumnName = "StoryId", DestinationColumnName = "StoryId"], [SourceColumnName = "FieldDefinitionId", DestinationColumnName = "FieldDefinitionId"], [SourceColumnName = "FieldValue", DestinationColumnName = "FieldValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryFieldValueTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryFieldValueTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryLinks_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StoryLinkId", DestinationColumnName = "StoryLinkId"], [SourceColumnName = "StoryId", DestinationColumnName = "StoryId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "ControlId", DestinationColumnName = "ControlId"], [SourceColumnName = "ObjectiveId", DestinationColumnName = "ObjectiveId"], [SourceColumnName = "ProcedureId", DestinationColumnName = "ProcedureId"], [SourceColumnName = "IssueId", DestinationColumnName = "IssueId"], [SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "CoachingNoteId", DestinationColumnName = "CoachingNoteId"], [SourceColumnName = "WorkpaperId", DestinationColumnName = "WorkpaperId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryLinks = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryLinks", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryOwners_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StoryOwnerId", DestinationColumnName = "StoryOwnerId"], [SourceColumnName = "StoryId", DestinationColumnName = "StoryId"], [SourceColumnName = "OwnerId", DestinationColumnName = "OwnerId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryOwners = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryOwners", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryReportingCategories_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ReportingCategoryId", DestinationColumnName = "ReportingCategoryId"], [SourceColumnName = "StoryStateName", DestinationColumnName = "StoryStateName"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryReportingCategories = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryReportingCategories", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StoryStates_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StoryStateId", DestinationColumnName = "StoryStateId"], [SourceColumnName = "StoryStateName", DestinationColumnName = "StoryStateName"], [SourceColumnName = "ReportingCategoryId", DestinationColumnName = "ReportingCategoryId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StoryStates = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StoryStates", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRisks_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "StrategicRiskCode", DestinationColumnName = "StrategicRiskCode"], [SourceColumnName = "StrategicRiskStateId", DestinationColumnName = "StrategicRiskStateId"], [SourceColumnName = "StrategicRiskState", DestinationColumnName = "StrategicRiskState"], [SourceColumnName = "Weight", DestinationColumnName = "Weight"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "ReviewDueDate", DestinationColumnName = "ReviewDueDate"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectSAPeriodID", DestinationColumnName = "MultiSelectSAPeriodID"], [SourceColumnName = "MultiSelectSAPeriod", DestinationColumnName = "MultiSelectSAPeriod"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "LastNotStartedLabel", DestinationColumnName = "LastNotStartedLabel"], [SourceColumnName = "LastNotStartedUserId", DestinationColumnName = "LastNotStartedUserId"], [SourceColumnName = "LastNotStartedUser", DestinationColumnName = "LastNotStartedUser"], [SourceColumnName = "LastNotStartedDate", DestinationColumnName = "LastNotStartedDate"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastCompletedLabel", DestinationColumnName = "LastCompletedLabel"], [SourceColumnName = "LastCompletedUserId", DestinationColumnName = "LastCompletedUserId"], [SourceColumnName = "LastCompletedUser", DestinationColumnName = "LastCompletedUser"], [SourceColumnName = "LastCompletedDate", DestinationColumnName = "LastCompletedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"], [SourceColumnName = "LastReviewedSubActionId", DestinationColumnName = "LastReviewedSubActionId"], [SourceColumnName = "LastReviewedSubActionLabel", DestinationColumnName = "LastReviewedSubActionLabel"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "TeamStoreStrategicRiskId", DestinationColumnName = "TeamStoreStrategicRiskId"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRisks = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRisks", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastNotStartedDate", type date}, {"LastInProgressDate", type date}, {"LastCompletedDate", type date}, {"LastReviewedDate", type date}, {"LastModifiedDate", type date}})
in
  #"Changed column type";
shared RiskScoringValues_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RiskScoringValues", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RiskScoringValuesAssessmentProject_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RiskScoringValues", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RiskTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RiskTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RiskWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RiskWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SecurityAssignments_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SecurityAssignments", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SecurityAssignmentsAggregated_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SecurityAssignmentsAggregated", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SelfAssessmentControls_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SelfAssessmentControls", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SelfAssessmentEntitys_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SelfAssessmentEntitys", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SelfAssessmentItemWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SelfAssessmentItemWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SelfAssessmentRisks_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SelfAssessmentRisks", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SelfAssessments_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SelfAssessments", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Sprints_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Sprints", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SprintStates_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SprintStates", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Stories_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Stories", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryFieldDefinitions_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryFieldDefinitions", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryFieldValues_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryFieldValues", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryFieldValueTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryFieldValueTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryLinks_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryLinks", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryOwners_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryOwners", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryReportingCategories_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryReportingCategories", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StoryStates_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StoryStates", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StrategicRisks_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRisks", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProcedureWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProcedureWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProjectPhaseMilestones_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProjectPhaseMilestones", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProjectPhases_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProjectPhases", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProjectPhaseWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProjectPhaseWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Projects_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Projects", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProjectTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProjectTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Recommendations_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Recommendations", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RecommendationStatusUpdates_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RecommendationStatusUpdates", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RecommendationTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RecommendationTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RecommendationWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RecommendationWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Risks_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Risks", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RiskScoringCalculations_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RiskScoringCalculations", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared RiskScoringCalculationsAssessmentProject_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "RiskScoringCalculationsAssessmentProject", ItemKind = "Table"]}[Data]
in
  TableNavigation;
