[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Assessments_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "AssessmentTitle", DestinationColumnName = "AssessmentTitle"], [SourceColumnName = "StartDate", DestinationColumnName = "StartDate"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "CreatedDate", DestinationColumnName = "CreatedDate"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Description", DestinationColumnName = "Description"], [SourceColumnName = "PrimaryDimensionId", DestinationColumnName = "PrimaryDimensionId"], [SourceColumnName = "PrimaryDimensionName", DestinationColumnName = "PrimaryDimensionName"], [SourceColumnName = "AssessmentStateId", DestinationColumnName = "AssessmentStateId"], [SourceColumnName = "AssessmentState", DestinationColumnName = "AssessmentState"], [SourceColumnName = "CreatedUserId", DestinationColumnName = "CreatedUserId"], [SourceColumnName = "CreatedUserName", DestinationColumnName = "CreatedUserName"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Assessments = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Assessments", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "AuditPlanCapacityPlanning_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "AuditPlanCapacityPlanningId", DestinationColumnName = "AuditPlanCapacityPlanningId"], [SourceColumnName = "AuditPlanId", DestinationColumnName = "AuditPlanId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "TimeAdminId", DestinationColumnName = "TimeAdminId"], [SourceColumnName = "TimeHolidayId", DestinationColumnName = "TimeHolidayId"], [SourceColumnName = "TimeNonWorkingId", DestinationColumnName = "TimeNonWorkingId"], [SourceColumnName = "CapacityRoleId", DestinationColumnName = "CapacityRoleId"], [SourceColumnName = "CapacityRole", DestinationColumnName = "CapacityRole"], [SourceColumnName = "EstimatedTime", DestinationColumnName = "EstimatedTime"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared AuditPlanCapacityPlanning = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "AuditPlanCapacityPlanning", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "AuditPlanCapacityPlanningEntry_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "AuditPlanCapacityPlanningEntryId", DestinationColumnName = "AuditPlanCapacityPlanningEntryId"], [SourceColumnName = "AuditPlanCapacityPlanningId", DestinationColumnName = "AuditPlanCapacityPlanningId"], [SourceColumnName = "Frequency", DestinationColumnName = "Frequency"], [SourceColumnName = "Time", DestinationColumnName = "Time"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared AuditPlanCapacityPlanningEntry = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "AuditPlanCapacityPlanningEntry", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "AuditPlanCapacityPlanningRole_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "AuditPlanCapacityPlanningRoleId", DestinationColumnName = "AuditPlanCapacityPlanningRoleId"], [SourceColumnName = "AuditPlanId", DestinationColumnName = "AuditPlanId"], [SourceColumnName = "CapacityRoleId", DestinationColumnName = "CapacityRoleId"], [SourceColumnName = "CapacityRole", DestinationColumnName = "CapacityRole"], [SourceColumnName = "Time", DestinationColumnName = "Time"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared AuditPlanCapacityPlanningRole = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "AuditPlanCapacityPlanningRole", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "AuditPlans_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "AuditPlanId", DestinationColumnName = "AuditPlanId"], [SourceColumnName = "AuditPlanTitle", DestinationColumnName = "AuditPlanTitle"], [SourceColumnName = "AuditPlanStateID", DestinationColumnName = "AuditPlanStateID"], [SourceColumnName = "AuditPlanState", DestinationColumnName = "AuditPlanState"], [SourceColumnName = "IsApproved", DestinationColumnName = "IsApproved"], [SourceColumnName = "ApprovedUserId", DestinationColumnName = "ApprovedUserId"], [SourceColumnName = "ApprovedUserName", DestinationColumnName = "ApprovedUserName"], [SourceColumnName = "ApprovedDate", DestinationColumnName = "ApprovedDate"], [SourceColumnName = "ClosedUserId", DestinationColumnName = "ClosedUserId"], [SourceColumnName = "ClosedUserName", DestinationColumnName = "ClosedUserName"], [SourceColumnName = "ClosedDate", DestinationColumnName = "ClosedDate"], [SourceColumnName = "StartDate", DestinationColumnName = "StartDate"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "BudgetedHours", DestinationColumnName = "BudgetedHours"], [SourceColumnName = "EstimatedResourceCosts", DestinationColumnName = "EstimatedResourceCosts"], [SourceColumnName = "ActualResourceCosts", DestinationColumnName = "ActualResourceCosts"], [SourceColumnName = "EstimatedExternalCosts", DestinationColumnName = "EstimatedExternalCosts"], [SourceColumnName = "ActualExternalCosts", DestinationColumnName = "ActualExternalCosts"], [SourceColumnName = "EstimatedExpenses", DestinationColumnName = "EstimatedExpenses"], [SourceColumnName = "ActualExpenses", DestinationColumnName = "ActualExpenses"], [SourceColumnName = "ActualHours", DestinationColumnName = "ActualHours"], [SourceColumnName = "CapacityPlanningFrequencyId", DestinationColumnName = "CapacityPlanningFrequencyId"], [SourceColumnName = "SchedulingLevelId", DestinationColumnName = "SchedulingLevelId"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared AuditPlans = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "AuditPlans", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "AuditPlanSchedule_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "AuditPlanScheduleId", DestinationColumnName = "AuditPlanScheduleId"], [SourceColumnName = "ResourceScheduleId", DestinationColumnName = "ResourceScheduleId"], [SourceColumnName = "AuditPlanId", DestinationColumnName = "AuditPlanId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "TimeAdminId", DestinationColumnName = "TimeAdminId"], [SourceColumnName = "TimeHolidayId", DestinationColumnName = "TimeHolidayId"], [SourceColumnName = "TimeNonWorkingId", DestinationColumnName = "TimeNonWorkingId"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "ResourceUserName", DestinationColumnName = "ResourceUserName"], [SourceColumnName = "EstimatedStartDate", DestinationColumnName = "EstimatedStartDate"], [SourceColumnName = "EstimatedEndDate", DestinationColumnName = "EstimatedEndDate"], [SourceColumnName = "EstimatedTime", DestinationColumnName = "EstimatedTime"], [SourceColumnName = "ScheduledStartDate", DestinationColumnName = "ScheduledStartDate"], [SourceColumnName = "ScheduledEndDate", DestinationColumnName = "ScheduledEndDate"], [SourceColumnName = "ScheduledTime", DestinationColumnName = "ScheduledTime"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared AuditPlanSchedule = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "AuditPlanSchedule", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProjectPhases_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectPhaseName", DestinationColumnName = "ProjectPhaseName"], [SourceColumnName = "SortOrder", DestinationColumnName = "SortOrder"], [SourceColumnName = "EstStartDate", DestinationColumnName = "EstStartDate"], [SourceColumnName = "EstEndDate", DestinationColumnName = "EstEndDate"], [SourceColumnName = "ActStartDate", DestinationColumnName = "ActStartDate"], [SourceColumnName = "ActEndDate", DestinationColumnName = "ActEndDate"], [SourceColumnName = "IsActive", DestinationColumnName = "IsActive"], [SourceColumnName = "EstHours", DestinationColumnName = "EstHours"], [SourceColumnName = "ActHours", DestinationColumnName = "ActHours"], [SourceColumnName = "IsComplete", DestinationColumnName = "IsComplete"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "RevisedDueDate", DestinationColumnName = "RevisedDueDate"], [SourceColumnName = "ReviewDueDate", DestinationColumnName = "ReviewDueDate"], [SourceColumnName = "ScheduledStartDate", DestinationColumnName = "ScheduledStartDate"], [SourceColumnName = "ScheduledEndDate", DestinationColumnName = "ScheduledEndDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProjectPhases = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProjectPhases", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProjectPhaseWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectPhaseWorkflowHistoryId", DestinationColumnName = "ProjectPhaseWorkflowHistoryId"], [SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "ProjectPhaseName", DestinationColumnName = "ProjectPhaseName"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectTitle", DestinationColumnName = "ProjectTitle"], [SourceColumnName = "ProjectCode", DestinationColumnName = "ProjectCode"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ProjectPhaseWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "ProjectPhaseWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Projects_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectTitle", DestinationColumnName = "ProjectTitle"], [SourceColumnName = "ProjectCode", DestinationColumnName = "ProjectCode"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "LocationCategoryId", DestinationColumnName = "LocationCategoryId"], [SourceColumnName = "LocationCategory", DestinationColumnName = "LocationCategory"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category9Id", DestinationColumnName = "Category9Id"], [SourceColumnName = "Category9", DestinationColumnName = "Category9"], [SourceColumnName = "Category10Id", DestinationColumnName = "Category10Id"], [SourceColumnName = "Category10", DestinationColumnName = "Category10"], [SourceColumnName = "Category11Id", DestinationColumnName = "Category11Id"], [SourceColumnName = "Category11", DestinationColumnName = "Category11"], [SourceColumnName = "Category12Id", DestinationColumnName = "Category12Id"], [SourceColumnName = "Category12", DestinationColumnName = "Category12"], [SourceColumnName = "Category13Id", DestinationColumnName = "Category13Id"], [SourceColumnName = "Category13", DestinationColumnName = "Category13"], [SourceColumnName = "RiskCategoryId", DestinationColumnName = "RiskCategoryId"], [SourceColumnName = "RiskCategory", DestinationColumnName = "RiskCategory"], [SourceColumnName = "FinalRiskCategoryId", DestinationColumnName = "FinalRiskCategoryId"], [SourceColumnName = "FinalRiskCategory", DestinationColumnName = "FinalRiskCategory"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "MultiSelectCategory7Id", DestinationColumnName = "MultiSelectCategory7Id"], [SourceColumnName = "MultiSelectCategory7", DestinationColumnName = "MultiSelectCategory7"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "NumericValue5", DestinationColumnName = "NumericValue5"], [SourceColumnName = "NumericValue6", DestinationColumnName = "NumericValue6"], [SourceColumnName = "NumericValue7", DestinationColumnName = "NumericValue7"], [SourceColumnName = "EstimatedStartDate", DestinationColumnName = "EstimatedStartDate"], [SourceColumnName = "EstimatedEndDate", DestinationColumnName = "EstimatedEndDate"], [SourceColumnName = "ActualStartDate", DestinationColumnName = "ActualStartDate"], [SourceColumnName = "ActualEndDate", DestinationColumnName = "ActualEndDate"], [SourceColumnName = "Date1", DestinationColumnName = "Date1"], [SourceColumnName = "Date2", DestinationColumnName = "Date2"], [SourceColumnName = "Date3", DestinationColumnName = "Date3"], [SourceColumnName = "Date4", DestinationColumnName = "Date4"], [SourceColumnName = "Date5", DestinationColumnName = "Date5"], [SourceColumnName = "Date6", DestinationColumnName = "Date6"], [SourceColumnName = "EstimatedHours", DestinationColumnName = "EstimatedHours"], [SourceColumnName = "ActualHours", DestinationColumnName = "ActualHours"], [SourceColumnName = "EstimatedResourceCosts", DestinationColumnName = "EstimatedResourceCosts"], [SourceColumnName = "ActualResourceCosts", DestinationColumnName = "ActualResourceCosts"], [SourceColumnName = "EstimatedExternalCosts", DestinationColumnName = "EstimatedExternalCosts"], [SourceColumnName = "ActualExternalCosts", DestinationColumnName = "ActualExternalCosts"], [SourceColumnName = "EstimatedExpenses", DestinationColumnName = "EstimatedExpenses"], [SourceColumnName = "ActualExpenses", DestinationColumnName = "ActualExpenses"], [SourceColumnName = "ProjectStateId", DestinationColumnName = "ProjectStateId"], [SourceColumnName = "ProjectState", DestinationColumnName = "ProjectState"], [SourceColumnName = "CurrentProjectPhaseValue", DestinationColumnName = "CurrentProjectPhaseValue"], [SourceColumnName = "CurrentProjectPhaseMilestoneValue", DestinationColumnName = "CurrentProjectPhaseMilestoneValue"], [SourceColumnName = "CombinedTotalHours", DestinationColumnName = "CombinedTotalHours"], [SourceColumnName = "CompletedDate", DestinationColumnName = "CompletedDate"], [SourceColumnName = "ScheduledStartDate", DestinationColumnName = "ScheduledStartDate"], [SourceColumnName = "ScheduledEndDate", DestinationColumnName = "ScheduledEndDate"], [SourceColumnName = "ActiveAuditPlanId", DestinationColumnName = "ActiveAuditPlanId"], [SourceColumnName = "ActiveAuditPlanTitle", DestinationColumnName = "ActiveAuditPlanTitle"], [SourceColumnName = "ProjectApprovalStateId", DestinationColumnName = "ProjectApprovalStateId"], [SourceColumnName = "ProjectApprovalState", DestinationColumnName = "ProjectApprovalState"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "YesNo3", DestinationColumnName = "YesNo3"], [SourceColumnName = "YesNo4", DestinationColumnName = "YesNo4"], [SourceColumnName = "YesNo5", DestinationColumnName = "YesNo5"], [SourceColumnName = "IsMigrated", DestinationColumnName = "IsMigrated"], [SourceColumnName = "IsOfflineMergeEnabled", DestinationColumnName = "IsOfflineMergeEnabled"], [SourceColumnName = "ExcludeAssessmentObjects", DestinationColumnName = "ExcludeAssessmentObjects"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Projects = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Projects", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamApprovers_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "ApproverAssignmentID", DestinationColumnName = "ApproverAssignmentID"], [SourceColumnName = "TeamId", DestinationColumnName = "TeamId"], [SourceColumnName = "ApproverUserId", DestinationColumnName = "ApproverUserId"], [SourceColumnName = "ApproverName", DestinationColumnName = "ApproverName"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamApprovers = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamApprovers", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Teams_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamId", DestinationColumnName = "TeamId"], [SourceColumnName = "TeamName", DestinationColumnName = "TeamName"], [SourceColumnName = "Description", DestinationColumnName = "Description"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Teams = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Teams", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamUsers_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamUserId", DestinationColumnName = "TeamUserId"], [SourceColumnName = "TeamId", DestinationColumnName = "TeamId"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamUsers = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamUsers", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimeAdmins_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimeAdminId", DestinationColumnName = "TimeAdminId"], [SourceColumnName = "TimeAdminName", DestinationColumnName = "TimeAdminName"], [SourceColumnName = "IsTimeAdminActive", DestinationColumnName = "IsTimeAdminActive"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimeAdmins = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimeAdmins", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimeCategories2_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimeCategory2Id", DestinationColumnName = "TimeCategory2Id"], [SourceColumnName = "TimeCategory2Name", DestinationColumnName = "TimeCategory2Name"], [SourceColumnName = "IsTimeCategory2Active", DestinationColumnName = "IsTimeCategory2Active"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimeCategories2 = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimeCategories2", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimeCategories3_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimeCategory3Id", DestinationColumnName = "TimeCategory3Id"], [SourceColumnName = "TimeCategory3Name", DestinationColumnName = "TimeCategory3Name"], [SourceColumnName = "IsTimeCategory3Active", DestinationColumnName = "IsTimeCategory3Active"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimeCategories3 = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimeCategories3", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimeHolidays_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimeHolidayId", DestinationColumnName = "TimeHolidayId"], [SourceColumnName = "HolidayName", DestinationColumnName = "HolidayName"], [SourceColumnName = "HolidayDate", DestinationColumnName = "HolidayDate"], [SourceColumnName = "IsHolidayActive", DestinationColumnName = "IsHolidayActive"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimeHolidays = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimeHolidays", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimeNonWorkings_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimeNonWorkingId", DestinationColumnName = "TimeNonWorkingId"], [SourceColumnName = "TimeNonWorkingName", DestinationColumnName = "TimeNonWorkingName"], [SourceColumnName = "IsTimeNonWorkingActive", DestinationColumnName = "IsTimeNonWorkingActive"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimeNonWorkings = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimeNonWorkings", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Timesheets_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimesheetId", DestinationColumnName = "TimesheetId"], [SourceColumnName = "BeginDate", DestinationColumnName = "BeginDate"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "User", DestinationColumnName = "User"], [SourceColumnName = "TimesheetStateId", DestinationColumnName = "TimesheetStateId"], [SourceColumnName = "TimesheetState", DestinationColumnName = "TimesheetState"], [SourceColumnName = "TimesheetStateSubActionId", DestinationColumnName = "TimesheetStateSubActionId"], [SourceColumnName = "TimesheetStateSubAction", DestinationColumnName = "TimesheetStateSubAction"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Timesheets = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Timesheets", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimesheetWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimesheetWorkflowHistoryId", DestinationColumnName = "TimesheetWorkflowHistoryId"], [SourceColumnName = "TimesheetId", DestinationColumnName = "TimesheetId"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimesheetWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimesheetWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TimeTrackingEntries_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TimeTrackingEntryId", DestinationColumnName = "TimeTrackingEntryId"], [SourceColumnName = "DateOfEntry", DestinationColumnName = "DateOfEntry"], [SourceColumnName = "TimeEntryUserId", DestinationColumnName = "TimeEntryUserId"], [SourceColumnName = "TimeEntryUser", DestinationColumnName = "TimeEntryUser"], [SourceColumnName = "TimesheetId", DestinationColumnName = "TimesheetId"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectPhaseId", DestinationColumnName = "ProjectPhaseId"], [SourceColumnName = "TimeAdminId", DestinationColumnName = "TimeAdminId"], [SourceColumnName = "TimeNonWorkingId", DestinationColumnName = "TimeNonWorkingId"], [SourceColumnName = "TimeHolidayId", DestinationColumnName = "TimeHolidayId"], [SourceColumnName = "TimeEntryTypeId", DestinationColumnName = "TimeEntryTypeId"], [SourceColumnName = "TimeEntryType", DestinationColumnName = "TimeEntryType"], [SourceColumnName = "AuditPlanId", DestinationColumnName = "AuditPlanId"], [SourceColumnName = "Hours", DestinationColumnName = "Hours"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"], [SourceColumnName = "TimeCategory2Id", DestinationColumnName = "TimeCategory2Id"], [SourceColumnName = "TimeCategory3Id", DestinationColumnName = "TimeCategory3Id"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TimeTrackingEntries = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TimeTrackingEntries", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Users_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "FirstName", DestinationColumnName = "FirstName"], [SourceColumnName = "LastName", DestinationColumnName = "LastName"], [SourceColumnName = "Phone", DestinationColumnName = "Phone"], [SourceColumnName = "Fax", DestinationColumnName = "Fax"], [SourceColumnName = "Email", DestinationColumnName = "Email"], [SourceColumnName = "StaffNumber", DestinationColumnName = "StaffNumber"], [SourceColumnName = "Address", DestinationColumnName = "Address"], [SourceColumnName = "Mobile", DestinationColumnName = "Mobile"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Teams", DestinationColumnName = "Teams"], [SourceColumnName = "IsUserActive", DestinationColumnName = "IsUserActive"], [SourceColumnName = "LoginName", DestinationColumnName = "LoginName"], [SourceColumnName = "LastLogin", DestinationColumnName = "LastLogin"], [SourceColumnName = "LastLogout", DestinationColumnName = "LastLogout"], [SourceColumnName = "CreatedDate", DestinationColumnName = "CreatedDate"], [SourceColumnName = "StandardHoursPerWeek", DestinationColumnName = "StandardHoursPerWeek"], [SourceColumnName = "PrimaryGroupId", DestinationColumnName = "PrimaryGroupId"], [SourceColumnName = "PrimaryGroupName", DestinationColumnName = "PrimaryGroupName"], [SourceColumnName = "Groups", DestinationColumnName = "Groups"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Users = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1/timetracking", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Users", Signature = "table"]}[Data]
in
  #"Navigation 1";
shared Assessments_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Assessments", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared AuditPlanCapacityPlanning_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "AuditPlanCapacityPlanning", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared AuditPlanCapacityPlanningEntry_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "AuditPlanCapacityPlanningEntry", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared AuditPlanCapacityPlanningRole_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "AuditPlanCapacityPlanningRole", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared AuditPlans_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "AuditPlans", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared AuditPlanSchedule_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "AuditPlanSchedule", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProjectPhases_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProjectPhases", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared ProjectPhaseWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProjectPhaseWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Projects_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Projects", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamApprovers_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamApprovers", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Teams_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Teams", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamUsers_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamUsers", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimeAdmins_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimeAdmins", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimeCategories2_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimeCategories2", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimeCategories3_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimeCategories3", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimeHolidays_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimeHolidays", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimeNonWorkings_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimeNonWorkings", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Timesheets_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Timesheets", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimesheetWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimesheetWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TimeTrackingEntries_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TimeTrackingEntries", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Users_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TimeSheet", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Users", ItemKind = "Table"]}[Data]
in
  TableNavigation;
