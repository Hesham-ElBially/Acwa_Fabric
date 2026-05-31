[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRiskScoringCalculations_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskScoringCalculatedId", DestinationColumnName = "StrategicRiskScoringCalculatedId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "CalculatedScoreType", DestinationColumnName = "CalculatedScoreType"], [SourceColumnName = "CalculatedScoreValue", DestinationColumnName = "CalculatedScoreValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRiskScoringCalculations = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRiskScoringCalculations", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRiskScoringCalculationsAssessmentProject_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskScoringCalculatedId", DestinationColumnName = "StrategicRiskScoringCalculatedId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "CalculatedScoreType", DestinationColumnName = "CalculatedScoreType"], [SourceColumnName = "CalculatedScoreValue", DestinationColumnName = "CalculatedScoreValue"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRiskScoringCalculationsAssessmentProject = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRiskScoringCalculationsAssessmentProject", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRiskScoringValues_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskScoreId", DestinationColumnName = "StrategicRiskScoreId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "VariableId", DestinationColumnName = "VariableId"], [SourceColumnName = "VariableTitle", DestinationColumnName = "VariableTitle"], [SourceColumnName = "MetricTitle", DestinationColumnName = "MetricTitle"], [SourceColumnName = "ScoreType", DestinationColumnName = "ScoreType"], [SourceColumnName = "ScoreLabel", DestinationColumnName = "ScoreLabel"], [SourceColumnName = "ScoreValue", DestinationColumnName = "ScoreValue"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRiskScoringValues = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRiskScoringValues", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRiskScoringValuesAssessmentProject_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskScoreId", DestinationColumnName = "StrategicRiskScoreId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "VariableId", DestinationColumnName = "VariableId"], [SourceColumnName = "VariableTitle", DestinationColumnName = "VariableTitle"], [SourceColumnName = "MetricTitle", DestinationColumnName = "MetricTitle"], [SourceColumnName = "ScoreType", DestinationColumnName = "ScoreType"], [SourceColumnName = "ScoreLabel", DestinationColumnName = "ScoreLabel"], [SourceColumnName = "ScoreValue", DestinationColumnName = "ScoreValue"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRiskScoringValuesAssessmentProject = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRiskScoringValuesAssessmentProject", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRiskTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRiskTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRiskTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StrategicRiskWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "StrategicRiskWorkflowHistoryId", DestinationColumnName = "StrategicRiskWorkflowHistoryId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "StrategicRiskTitle", DestinationColumnName = "StrategicRiskTitle"], [SourceColumnName = "StrategicRiskCode", DestinationColumnName = "StrategicRiskCode"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "ReviewSequence", DestinationColumnName = "ReviewSequence"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared StrategicRiskWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "StrategicRiskWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SurveyQuestionAnswerChoices_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "QuestionId", DestinationColumnName = "QuestionId"], [SourceColumnName = "QuestionText", DestinationColumnName = "QuestionText"], [SourceColumnName = "AnswerChoices", DestinationColumnName = "AnswerChoices"], [SourceColumnName = "IsRequired", DestinationColumnName = "IsRequired"], [SourceColumnName = "AllowComments", DestinationColumnName = "AllowComments"], [SourceColumnName = "TemplateQuestionId", DestinationColumnName = "TemplateQuestionId"], [SourceColumnName = "QuestionTypeId", DestinationColumnName = "QuestionTypeId"], [SourceColumnName = "QuestionTypeName", DestinationColumnName = "QuestionTypeName"], [SourceColumnName = "SurveyId", DestinationColumnName = "SurveyId"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SurveyQuestionAnswerChoices = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SurveyQuestionAnswerChoices", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SurveyRecipients_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SurveyRecipientId", DestinationColumnName = "SurveyRecipientId"], [SourceColumnName = "SurveyId", DestinationColumnName = "SurveyId"], [SourceColumnName = "SurveyRecipientStateId", DestinationColumnName = "SurveyRecipientStateId"], [SourceColumnName = "SurveyRecipientState", DestinationColumnName = "SurveyRecipientState"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "ContactUserId", DestinationColumnName = "ContactUserId"], [SourceColumnName = "ContactUserName", DestinationColumnName = "ContactUserName"], [SourceColumnName = "ContactUserEmail", DestinationColumnName = "ContactUserEmail"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SurveyRecipients = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SurveyRecipients", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SurveyRecipientSelfAssessments_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SurveyRecipientSelfAssessmentId", DestinationColumnName = "SurveyRecipientSelfAssessmentId"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SurveyId", DestinationColumnName = "SurveyId"], [SourceColumnName = "SelfAssessmentItemId", DestinationColumnName = "SelfAssessmentItemId"], [SourceColumnName = "ContactUserId", DestinationColumnName = "ContactUserId"], [SourceColumnName = "ContactUserName", DestinationColumnName = "ContactUserName"], [SourceColumnName = "ContactUserEmail", DestinationColumnName = "ContactUserEmail"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SurveyRecipientSelfAssessments = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SurveyRecipientSelfAssessments", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SurveyResponses_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SurveyResponseId", DestinationColumnName = "SurveyResponseId"], [SourceColumnName = "SurveyId", DestinationColumnName = "SurveyId"], [SourceColumnName = "SurveyRecipientId", DestinationColumnName = "SurveyRecipientId"], [SourceColumnName = "RecipientContactId", DestinationColumnName = "RecipientContactId"], [SourceColumnName = "RecipientContactName", DestinationColumnName = "RecipientContactName"], [SourceColumnName = "QuestionId", DestinationColumnName = "QuestionId"], [SourceColumnName = "QuestionText", DestinationColumnName = "QuestionText"], [SourceColumnName = "QuestionComments", DestinationColumnName = "QuestionComments"], [SourceColumnName = "AnswerTexts", DestinationColumnName = "AnswerTexts"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SurveyResponses = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SurveyResponses", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SurveyResponseSelfAssessments_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SurveyResponseSelfAssessmentId", DestinationColumnName = "SurveyResponseSelfAssessmentId"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SurveyId", DestinationColumnName = "SurveyId"], [SourceColumnName = "SelfAssessmentItemId", DestinationColumnName = "SelfAssessmentItemId"], [SourceColumnName = "RecipientUserId", DestinationColumnName = "RecipientUserId"], [SourceColumnName = "RecipientUserName", DestinationColumnName = "RecipientUserName"], [SourceColumnName = "QuestionId", DestinationColumnName = "QuestionId"], [SourceColumnName = "QuestionText", DestinationColumnName = "QuestionText"], [SourceColumnName = "QuestionComments", DestinationColumnName = "QuestionComments"], [SourceColumnName = "AnswerTexts", DestinationColumnName = "AnswerTexts"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SurveyResponseSelfAssessments = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "SurveyResponseSelfAssessments", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Surveys_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "SurveyId", DestinationColumnName = "SurveyId"], [SourceColumnName = "SurveyTitle", DestinationColumnName = "SurveyTitle"], [SourceColumnName = "SurveyStateId", DestinationColumnName = "SurveyStateId"], [SourceColumnName = "SurveyState", DestinationColumnName = "SurveyState"], [SourceColumnName = "SurveyTemplateId", DestinationColumnName = "SurveyTemplateId"], [SourceColumnName = "SurveyTemplateTitle", DestinationColumnName = "SurveyTemplateTitle"], [SourceColumnName = "AssessmentId", DestinationColumnName = "AssessmentId"], [SourceColumnName = "AssessmentTitle", DestinationColumnName = "AssessmentTitle"], [SourceColumnName = "ProjectId", DestinationColumnName = "ProjectId"], [SourceColumnName = "ProjectTitle", DestinationColumnName = "ProjectTitle"], [SourceColumnName = "SelfAssessmentId", DestinationColumnName = "SelfAssessmentId"], [SourceColumnName = "SelfAssessmentTitle", DestinationColumnName = "SelfAssessmentTitle"], [SourceColumnName = "EndDate", DestinationColumnName = "EndDate"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "IsPublished", DestinationColumnName = "IsPublished"], [SourceColumnName = "IsConfidential", DestinationColumnName = "IsConfidential"], [SourceColumnName = "Description", DestinationColumnName = "Description"], [SourceColumnName = "Instructions", DestinationColumnName = "Instructions"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Surveys = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Surveys", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreControls_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreControlId", DestinationColumnName = "TeamStoreControlId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Code", DestinationColumnName = "Code"], [SourceColumnName = "IsKey", DestinationColumnName = "IsKey"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "NumericValue5", DestinationColumnName = "NumericValue5"], [SourceColumnName = "NumericValue6", DestinationColumnName = "NumericValue6"], [SourceColumnName = "NumericValue7", DestinationColumnName = "NumericValue7"], [SourceColumnName = "NumericValue8", DestinationColumnName = "NumericValue8"], [SourceColumnName = "NumericValue9", DestinationColumnName = "NumericValue9"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category11Id", DestinationColumnName = "Category11Id"], [SourceColumnName = "Category11", DestinationColumnName = "Category11"], [SourceColumnName = "Category12Id", DestinationColumnName = "Category12Id"], [SourceColumnName = "Category12", DestinationColumnName = "Category12"], [SourceColumnName = "Category13Id", DestinationColumnName = "Category13Id"], [SourceColumnName = "Category13", DestinationColumnName = "Category13"], [SourceColumnName = "Category14Id", DestinationColumnName = "Category14Id"], [SourceColumnName = "Category14", DestinationColumnName = "Category14"], [SourceColumnName = "Category15Id", DestinationColumnName = "Category15Id"], [SourceColumnName = "Category15", DestinationColumnName = "Category15"], [SourceColumnName = "Category16Id", DestinationColumnName = "Category16Id"], [SourceColumnName = "Category16", DestinationColumnName = "Category16"], [SourceColumnName = "Category17Id", DestinationColumnName = "Category17Id"], [SourceColumnName = "Category17", DestinationColumnName = "Category17"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectSAQuarterId", DestinationColumnName = "MultiSelectSAQuarterId"], [SourceColumnName = "MultiSelectSAQuarter", DestinationColumnName = "MultiSelectSAQuarter"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "MultiSelectCategory7Id", DestinationColumnName = "MultiSelectCategory7Id"], [SourceColumnName = "MultiSelectCategory7", DestinationColumnName = "MultiSelectCategory7"], [SourceColumnName = "MultiSelectCategory8Id", DestinationColumnName = "MultiSelectCategory8Id"], [SourceColumnName = "MultiSelectCategory8", DestinationColumnName = "MultiSelectCategory8"], [SourceColumnName = "MultiSelectCategory9Id", DestinationColumnName = "MultiSelectCategory9Id"], [SourceColumnName = "MultiSelectCategory9", DestinationColumnName = "MultiSelectCategory9"], [SourceColumnName = "MultiSelectCategory10Id", DestinationColumnName = "MultiSelectCategory10Id"], [SourceColumnName = "MultiSelectCategory10", DestinationColumnName = "MultiSelectCategory10"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreControls = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreControls", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreControlTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreControlId", DestinationColumnName = "TeamStoreControlId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreControlTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreControlTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreIssues_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreIssueId", DestinationColumnName = "TeamStoreIssueId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Code", DestinationColumnName = "Code"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category9Id", DestinationColumnName = "Category9Id"], [SourceColumnName = "Category9", DestinationColumnName = "Category9"], [SourceColumnName = "Category10Id", DestinationColumnName = "Category10Id"], [SourceColumnName = "Category10", DestinationColumnName = "Category10"], [SourceColumnName = "Category11Id", DestinationColumnName = "Category11Id"], [SourceColumnName = "Category11", DestinationColumnName = "Category11"], [SourceColumnName = "Category12Id", DestinationColumnName = "Category12Id"], [SourceColumnName = "Category12", DestinationColumnName = "Category12"], [SourceColumnName = "Category13Id", DestinationColumnName = "Category13Id"], [SourceColumnName = "Category13", DestinationColumnName = "Category13"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "NumericValue5", DestinationColumnName = "NumericValue5"], [SourceColumnName = "NumericValue6", DestinationColumnName = "NumericValue6"], [SourceColumnName = "NumericValue7", DestinationColumnName = "NumericValue7"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "YesNo3", DestinationColumnName = "YesNo3"], [SourceColumnName = "YesNo4", DestinationColumnName = "YesNo4"], [SourceColumnName = "YesNo5", DestinationColumnName = "YesNo5"], [SourceColumnName = "YesNo6", DestinationColumnName = "YesNo6"], [SourceColumnName = "YesNo7", DestinationColumnName = "YesNo7"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreIssues = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreIssues", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreIssueTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreIssueId", DestinationColumnName = "TeamStoreIssueId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"], [SourceColumnName = "Text8", DestinationColumnName = "Text8"], [SourceColumnName = "Text9", DestinationColumnName = "Text9"], [SourceColumnName = "Text10", DestinationColumnName = "Text10"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreIssueTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreIssueTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreObjectives_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreObjectiveId", DestinationColumnName = "TeamStoreObjectiveId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Code", DestinationColumnName = "Code"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreObjectives = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreObjectives", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreObjectiveTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreObjectiveId", DestinationColumnName = "TeamStoreObjectiveId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreObjectiveTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreObjectiveTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreProcedures_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreProcedureId", DestinationColumnName = "TeamStoreProcedureId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "ScoreYesNo1", DestinationColumnName = "ScoreYesNo1"], [SourceColumnName = "ScoreNumericValue1", DestinationColumnName = "ScoreNumericValue1"], [SourceColumnName = "ScoreNumericValue2", DestinationColumnName = "ScoreNumericValue2"], [SourceColumnName = "ScoreNumericValue3", DestinationColumnName = "ScoreNumericValue3"], [SourceColumnName = "ScoreNumericValue4", DestinationColumnName = "ScoreNumericValue4"], [SourceColumnName = "ScoreNumericValue5", DestinationColumnName = "ScoreNumericValue5"], [SourceColumnName = "ScoreNumericValue6", DestinationColumnName = "ScoreNumericValue6"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category9Id", DestinationColumnName = "Category9Id"], [SourceColumnName = "Category9", DestinationColumnName = "Category9"], [SourceColumnName = "Category10Id", DestinationColumnName = "Category10Id"], [SourceColumnName = "Category10", DestinationColumnName = "Category10"], [SourceColumnName = "Category11Id", DestinationColumnName = "Category11Id"], [SourceColumnName = "Category11", DestinationColumnName = "Category11"], [SourceColumnName = "ScoreCategory1Id", DestinationColumnName = "ScoreCategory1Id"], [SourceColumnName = "ScoreCategory1", DestinationColumnName = "ScoreCategory1"], [SourceColumnName = "ScoreCategory2Id", DestinationColumnName = "ScoreCategory2Id"], [SourceColumnName = "ScoreCategory2", DestinationColumnName = "ScoreCategory2"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreProcedures = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreProcedures", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreProcedureTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreProcedureId", DestinationColumnName = "TeamStoreProcedureId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "ResultsText1", DestinationColumnName = "ResultsText1"], [SourceColumnName = "ResultsText2", DestinationColumnName = "ResultsText2"], [SourceColumnName = "ResultsText3", DestinationColumnName = "ResultsText3"], [SourceColumnName = "ResultsText4", DestinationColumnName = "ResultsText4"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreProcedureTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreProcedureTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreRecommendations_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreRecommendationId", DestinationColumnName = "TeamStoreRecommendationId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Code", DestinationColumnName = "Code"], [SourceColumnName = "PriorityCategoryId", DestinationColumnName = "PriorityCategoryId"], [SourceColumnName = "PriorityCategory", DestinationColumnName = "PriorityCategory"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "RecommendationStatusID", DestinationColumnName = "RecommendationStatusID"], [SourceColumnName = "RecommendationStatus", DestinationColumnName = "RecommendationStatus"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "Category7Id", DestinationColumnName = "Category7Id"], [SourceColumnName = "Category7", DestinationColumnName = "Category7"], [SourceColumnName = "Category8Id", DestinationColumnName = "Category8Id"], [SourceColumnName = "Category8", DestinationColumnName = "Category8"], [SourceColumnName = "Category9Id", DestinationColumnName = "Category9Id"], [SourceColumnName = "Category9", DestinationColumnName = "Category9"], [SourceColumnName = "Category10Id", DestinationColumnName = "Category10Id"], [SourceColumnName = "Category10", DestinationColumnName = "Category10"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "NumericValue4", DestinationColumnName = "NumericValue4"], [SourceColumnName = "NumericValue5", DestinationColumnName = "NumericValue5"], [SourceColumnName = "NumericValue6", DestinationColumnName = "NumericValue6"], [SourceColumnName = "NumericValue7", DestinationColumnName = "NumericValue7"], [SourceColumnName = "NumericValue8", DestinationColumnName = "NumericValue8"], [SourceColumnName = "NumericValue9", DestinationColumnName = "NumericValue9"], [SourceColumnName = "NumericValue10", DestinationColumnName = "NumericValue10"], [SourceColumnName = "NumericValue11", DestinationColumnName = "NumericValue11"], [SourceColumnName = "NumericValue12", DestinationColumnName = "NumericValue12"], [SourceColumnName = "Date1", DestinationColumnName = "Date1"], [SourceColumnName = "Date2", DestinationColumnName = "Date2"], [SourceColumnName = "Date3", DestinationColumnName = "Date3"], [SourceColumnName = "Date4", DestinationColumnName = "Date4"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "YesNo3", DestinationColumnName = "YesNo3"], [SourceColumnName = "YesNo4", DestinationColumnName = "YesNo4"], [SourceColumnName = "YesNo5", DestinationColumnName = "YesNo5"], [SourceColumnName = "YesNo6", DestinationColumnName = "YesNo6"], [SourceColumnName = "YesNo7", DestinationColumnName = "YesNo7"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "MultiSelectCategory6Id", DestinationColumnName = "MultiSelectCategory6Id"], [SourceColumnName = "MultiSelectCategory6", DestinationColumnName = "MultiSelectCategory6"], [SourceColumnName = "TeamStoreIssueId", DestinationColumnName = "TeamStoreIssueId"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreRecommendations = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreRecommendations", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreRecommendationTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreRecommendationId", DestinationColumnName = "TeamStoreRecommendationId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"], [SourceColumnName = "Text8", DestinationColumnName = "Text8"], [SourceColumnName = "Text9", DestinationColumnName = "Text9"], [SourceColumnName = "Text10", DestinationColumnName = "Text10"], [SourceColumnName = "Text11", DestinationColumnName = "Text11"], [SourceColumnName = "Text12", DestinationColumnName = "Text12"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreRecommendationTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreRecommendationTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreRisks_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreRiskId", DestinationColumnName = "TeamStoreRiskId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Code", DestinationColumnName = "Code"], [SourceColumnName = "Weight", DestinationColumnName = "Weight"], [SourceColumnName = "IsStrategic", DestinationColumnName = "IsStrategic"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreRisks = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreRisks", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreRiskTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreRiskId", DestinationColumnName = "TeamStoreRiskId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreRiskTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreRiskTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreStrategicRisks_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreStrategicRiskId", DestinationColumnName = "TeamStoreStrategicRiskId"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Code", DestinationColumnName = "Code"], [SourceColumnName = "Weight", DestinationColumnName = "Weight"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "Category6Id", DestinationColumnName = "Category6Id"], [SourceColumnName = "Category6", DestinationColumnName = "Category6"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"], [SourceColumnName = "CabinetName", DestinationColumnName = "CabinetName"], [SourceColumnName = "CabinetFolder", DestinationColumnName = "CabinetFolder"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreStrategicRisks = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreStrategicRisks", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "TeamStoreStrategicRiskTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TeamStoreStrategicRiskId", DestinationColumnName = "TeamStoreStrategicRiskId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"], [SourceColumnName = "Text4", DestinationColumnName = "Text4"], [SourceColumnName = "Text5", DestinationColumnName = "Text5"], [SourceColumnName = "Text6", DestinationColumnName = "Text6"], [SourceColumnName = "Text7", DestinationColumnName = "Text7"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared TeamStoreStrategicRiskTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "TeamStoreStrategicRiskTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Terminologies_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "TerminologyId", DestinationColumnName = "TerminologyId"], [SourceColumnName = "TerminologyName", DestinationColumnName = "TerminologyName"], [SourceColumnName = "TerminologyValue", DestinationColumnName = "TerminologyValue"], [SourceColumnName = "IsVisible", DestinationColumnName = "IsVisible"], [SourceColumnName = "TermSource", DestinationColumnName = "TermSource"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Terminologies = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Terminologies", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Users_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "FirstName", DestinationColumnName = "FirstName"], [SourceColumnName = "LastName", DestinationColumnName = "LastName"], [SourceColumnName = "Phone", DestinationColumnName = "Phone"], [SourceColumnName = "Fax", DestinationColumnName = "Fax"], [SourceColumnName = "Email", DestinationColumnName = "Email"], [SourceColumnName = "StaffNumber", DestinationColumnName = "StaffNumber"], [SourceColumnName = "Address", DestinationColumnName = "Address"], [SourceColumnName = "Mobile", DestinationColumnName = "Mobile"], [SourceColumnName = "Title", DestinationColumnName = "Title"], [SourceColumnName = "Teams", DestinationColumnName = "Teams"], [SourceColumnName = "IsUserActive", DestinationColumnName = "IsUserActive"], [SourceColumnName = "LoginName", DestinationColumnName = "LoginName"], [SourceColumnName = "LastLogin", DestinationColumnName = "LastLogin"], [SourceColumnName = "LastLogout", DestinationColumnName = "LastLogout"], [SourceColumnName = "CreatedDate", DestinationColumnName = "CreatedDate"], [SourceColumnName = "StandardHoursPerWeek", DestinationColumnName = "StandardHoursPerWeek"], [SourceColumnName = "PrimaryGroupId", DestinationColumnName = "PrimaryGroupId"], [SourceColumnName = "PrimaryGroupName", DestinationColumnName = "PrimaryGroupName"], [SourceColumnName = "Groups", DestinationColumnName = "Groups"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "NumericValue3", DestinationColumnName = "NumericValue3"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "Category5Id", DestinationColumnName = "Category5Id"], [SourceColumnName = "Category5", DestinationColumnName = "Category5"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "MultiSelectCategory2Id", DestinationColumnName = "MultiSelectCategory2Id"], [SourceColumnName = "MultiSelectCategory2", DestinationColumnName = "MultiSelectCategory2"], [SourceColumnName = "MultiSelectCategory3Id", DestinationColumnName = "MultiSelectCategory3Id"], [SourceColumnName = "MultiSelectCategory3", DestinationColumnName = "MultiSelectCategory3"], [SourceColumnName = "MultiSelectCategory4Id", DestinationColumnName = "MultiSelectCategory4Id"], [SourceColumnName = "MultiSelectCategory4", DestinationColumnName = "MultiSelectCategory4"], [SourceColumnName = "MultiSelectCategory5Id", DestinationColumnName = "MultiSelectCategory5Id"], [SourceColumnName = "MultiSelectCategory5", DestinationColumnName = "MultiSelectCategory5"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Users = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Users", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Workpapers_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "WorkpaperId", DestinationColumnName = "WorkpaperId"], [SourceColumnName = "WorkpaperTitle", DestinationColumnName = "WorkpaperTitle"], [SourceColumnName = "WorkpaperCode", DestinationColumnName = "WorkpaperCode"], [SourceColumnName = "WorkpaperStateId", DestinationColumnName = "WorkpaperStateId"], [SourceColumnName = "WorkpaperState", DestinationColumnName = "WorkpaperState"], [SourceColumnName = "WorkpaperStateSubActionId", DestinationColumnName = "WorkpaperStateSubActionId"], [SourceColumnName = "WorkpaperStateSubAction", DestinationColumnName = "WorkpaperStateSubAction"], [SourceColumnName = "DueDate", DestinationColumnName = "DueDate"], [SourceColumnName = "ReviewDueDate", DestinationColumnName = "ReviewDueDate"], [SourceColumnName = "Category1Id", DestinationColumnName = "Category1Id"], [SourceColumnName = "Category1", DestinationColumnName = "Category1"], [SourceColumnName = "Category2Id", DestinationColumnName = "Category2Id"], [SourceColumnName = "Category2", DestinationColumnName = "Category2"], [SourceColumnName = "Category3Id", DestinationColumnName = "Category3Id"], [SourceColumnName = "Category3", DestinationColumnName = "Category3"], [SourceColumnName = "Category4Id", DestinationColumnName = "Category4Id"], [SourceColumnName = "Category4", DestinationColumnName = "Category4"], [SourceColumnName = "CategoryTypeId", DestinationColumnName = "CategoryTypeId"], [SourceColumnName = "CategoryType", DestinationColumnName = "CategoryType"], [SourceColumnName = "MultiSelectCategory1Id", DestinationColumnName = "MultiSelectCategory1Id"], [SourceColumnName = "MultiSelectCategory1", DestinationColumnName = "MultiSelectCategory1"], [SourceColumnName = "NumericValue1", DestinationColumnName = "NumericValue1"], [SourceColumnName = "NumericValue2", DestinationColumnName = "NumericValue2"], [SourceColumnName = "YesNo1", DestinationColumnName = "YesNo1"], [SourceColumnName = "YesNo2", DestinationColumnName = "YesNo2"], [SourceColumnName = "TMAnalytics", DestinationColumnName = "TMAnalytics"], [SourceColumnName = "DocumentFileName", DestinationColumnName = "DocumentFileName"], [SourceColumnName = "DocumentType", DestinationColumnName = "DocumentType"], [SourceColumnName = "DocumentDataSize", DestinationColumnName = "DocumentDataSize"], [SourceColumnName = "CheckedOutBy", DestinationColumnName = "CheckedOutBy"], [SourceColumnName = "CheckedOutDate", DestinationColumnName = "CheckedOutDate"], [SourceColumnName = "LastNotStartedLabel", DestinationColumnName = "LastNotStartedLabel"], [SourceColumnName = "LastNotStartedUserID", DestinationColumnName = "LastNotStartedUserID"], [SourceColumnName = "LastNotStartedUser", DestinationColumnName = "LastNotStartedUser"], [SourceColumnName = "LastNotStartedDate", DestinationColumnName = "LastNotStartedDate"], [SourceColumnName = "LastInProgressLabel", DestinationColumnName = "LastInProgressLabel"], [SourceColumnName = "LastInProgressUserId", DestinationColumnName = "LastInProgressUserId"], [SourceColumnName = "LastInProgressUser", DestinationColumnName = "LastInProgressUser"], [SourceColumnName = "LastInProgressDate", DestinationColumnName = "LastInProgressDate"], [SourceColumnName = "LastCompletedLabel", DestinationColumnName = "LastCompletedLabel"], [SourceColumnName = "LastCompletedUserId", DestinationColumnName = "LastCompletedUserId"], [SourceColumnName = "LastCompletedUser", DestinationColumnName = "LastCompletedUser"], [SourceColumnName = "LastCompletedDate", DestinationColumnName = "LastCompletedDate"], [SourceColumnName = "LastReviewedLabel", DestinationColumnName = "LastReviewedLabel"], [SourceColumnName = "LastReviewedUserId", DestinationColumnName = "LastReviewedUserId"], [SourceColumnName = "LastReviewedUser", DestinationColumnName = "LastReviewedUser"], [SourceColumnName = "LastReviewedDate", DestinationColumnName = "LastReviewedDate"], [SourceColumnName = "LastReviewedSubActionId", DestinationColumnName = "LastReviewedSubActionId"], [SourceColumnName = "LastReviewedSubActionLabel", DestinationColumnName = "LastReviewedSubActionLabel"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "EntityId", DestinationColumnName = "EntityId"], [SourceColumnName = "StrategicRiskId", DestinationColumnName = "StrategicRiskId"], [SourceColumnName = "RiskId", DestinationColumnName = "RiskId"], [SourceColumnName = "ControlId", DestinationColumnName = "ControlId"], [SourceColumnName = "ObjectiveId", DestinationColumnName = "ObjectiveId"], [SourceColumnName = "ProcedureId", DestinationColumnName = "ProcedureId"], [SourceColumnName = "IssueId", DestinationColumnName = "IssueId"], [SourceColumnName = "RecommendationId", DestinationColumnName = "RecommendationId"], [SourceColumnName = "FolderId", DestinationColumnName = "FolderId"], [SourceColumnName = "LastModifiedUserId", DestinationColumnName = "LastModifiedUserId"], [SourceColumnName = "LastModifiedUser", DestinationColumnName = "LastModifiedUser"], [SourceColumnName = "LastModifiedDate", DestinationColumnName = "LastModifiedDate"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Workpapers = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "Workpapers", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"CheckedOutDate", type date}, {"LastNotStartedDate", type date}, {"LastInProgressDate", type date}, {"LastCompletedDate", type date}, {"LastReviewedDate", type date}, {"LastModifiedDate", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "WorkpaperTexts_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "WorkpaperId", DestinationColumnName = "WorkpaperId"], [SourceColumnName = "Text1", DestinationColumnName = "Text1"], [SourceColumnName = "Text2", DestinationColumnName = "Text2"], [SourceColumnName = "Text3", DestinationColumnName = "Text3"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared WorkpaperTexts = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "WorkpaperTexts", Signature = "table"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "WorkpaperWorkflowHistory_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "WorkpaperWorkflowHistoryId", DestinationColumnName = "WorkpaperWorkflowHistoryId"], [SourceColumnName = "WorkpaperId", DestinationColumnName = "WorkpaperId"], [SourceColumnName = "WorkpaperTitle", DestinationColumnName = "WorkpaperTitle"], [SourceColumnName = "WorkpaperCode", DestinationColumnName = "WorkpaperCode"], [SourceColumnName = "ActionDate", DestinationColumnName = "ActionDate"], [SourceColumnName = "WorkflowStateId", DestinationColumnName = "WorkflowStateId"], [SourceColumnName = "WorkflowState", DestinationColumnName = "WorkflowState"], [SourceColumnName = "WorkflowSubActionId", DestinationColumnName = "WorkflowSubActionId"], [SourceColumnName = "WorkflowSubAction", DestinationColumnName = "WorkflowSubAction"], [SourceColumnName = "ReviewSequence", DestinationColumnName = "ReviewSequence"], [SourceColumnName = "RequiredSequences", DestinationColumnName = "RequiredSequences"], [SourceColumnName = "CompletedSequences", DestinationColumnName = "CompletedSequences"], [SourceColumnName = "UserId", DestinationColumnName = "UserId"], [SourceColumnName = "UserName", DestinationColumnName = "UserName"], [SourceColumnName = "Comment", DestinationColumnName = "Comment"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared WorkpaperWorkflowHistory = let
  Source = OData.Feed("https://acwapoweria.teammatehosting.com/TeamMate/odata/v1", null, [Implementation = "2.0"]),
  #"Navigation 1" = Source{[Name = "WorkpaperWorkflowHistory", Signature = "table"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"ActionDate", type date}})
in
  #"Changed column type";
shared StrategicRiskScoringCalculations_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRiskScoringCalculations", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StrategicRiskScoringCalculationsAssessmentProject_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRiskScoringCalculationsAssessmentProject", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StrategicRiskScoringValues_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRiskScoringValues", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StrategicRiskScoringValuesAssessmentProject_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRiskScoringValuesAssessmentProject", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StrategicRiskTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRiskTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared StrategicRiskWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "StrategicRiskWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SurveyRecipients_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SurveyRecipients", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SurveyRecipientSelfAssessments_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SurveyRecipientSelfAssessments", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SurveyResponses_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SurveyResponses", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SurveyResponseSelfAssessments_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SurveyResponseSelfAssessments", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Surveys_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Surveys", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreControls_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreControls", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreControlTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreControlTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreIssues_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreIssues", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreIssueTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreIssueTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreObjectives_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreObjectives", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreObjectiveTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreObjectiveTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreProcedures_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreProcedures", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreProcedureTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreProcedureTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreRecommendationTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreRecommendationTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreRisks_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreRisks", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreRiskTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreRiskTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreStrategicRisks_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreStrategicRisks", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Terminologies_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Terminologies", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Users_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Users", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared Workpapers_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Workpapers", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared WorkpaperTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "WorkpaperTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared WorkpaperWorkflowHistory_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "WorkpaperWorkflowHistory", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared SurveyQuestionAnswerChoices_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "SurveyQuestionAnswerChoices", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreRecommendations_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreRecommendations", ItemKind = "Table"]}[Data]
in
  TableNavigation;
shared TeamStoreStrategicRiskTexts_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = true, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "a5544863-6aa9-48f3-84fa-e9a76d8dcd77"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4b403f62-6306-45cc-bf4c-14ddf856362f"]}[Data],
  Navigation_3 = Navigation_2{[Id = "sch_TeamMate", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "TeamStoreStrategicRiskTexts", ItemKind = "Table"]}[Data]
in
  TableNavigation;
