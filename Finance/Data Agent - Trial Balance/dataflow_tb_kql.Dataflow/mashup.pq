[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "trial_balance_mapping_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "Ledger_Name", DestinationColumnName = "Ledger_Name"], [SourceColumnName = "UniqueCodeKey", DestinationColumnName = "UniqueCodeKey"], [SourceColumnName = "Entity_Code", DestinationColumnName = "Entity_Code"], [SourceColumnName = "Entity_Name", DestinationColumnName = "Entity_Name"], [SourceColumnName = "Business_Line_Code", DestinationColumnName = "Business_Line_Code"], [SourceColumnName = "Business_Line_Name", DestinationColumnName = "Business_Line_Name"], [SourceColumnName = "Cost_Center_Code", DestinationColumnName = "Cost_Center_Code"], [SourceColumnName = "Cost_Center_Name", DestinationColumnName = "Cost_Center_Name"], [SourceColumnName = "Project_Code", DestinationColumnName = "Project_Code"], [SourceColumnName = "Project_Name", DestinationColumnName = "Project_Name"], [SourceColumnName = "Intercompany_Code", DestinationColumnName = "Intercompany_Code"], [SourceColumnName = "Intercompany_Name", DestinationColumnName = "Intercompany_Name"], [SourceColumnName = "Account_Code", DestinationColumnName = "Account_Code"], [SourceColumnName = "Account_Name", DestinationColumnName = "Account_Name"], [SourceColumnName = "Analytical_Code", DestinationColumnName = "Analytical_Code"], [SourceColumnName = "Analytical_Code_Name", DestinationColumnName = "Analytical_Code_Name"], [SourceColumnName = "Region_Code", DestinationColumnName = "Region_Code"], [SourceColumnName = "Region_Name", DestinationColumnName = "Region_Name"], [SourceColumnName = "Currency_Code", DestinationColumnName = "Currency_Code"], [SourceColumnName = "Opening_Balance", DestinationColumnName = "Opening_Balance"], [SourceColumnName = "Total_Debit", DestinationColumnName = "Total_Debit"], [SourceColumnName = "Total_Credit", DestinationColumnName = "Total_Credit"], [SourceColumnName = "Closing_Balance", DestinationColumnName = "Closing_Balance"], [SourceColumnName = "Opening_Balance_SAR", DestinationColumnName = "Opening_Balance_SAR"], [SourceColumnName = "Total_Debit_SAR", DestinationColumnName = "Total_Debit_SAR"], [SourceColumnName = "Total_Credit_SAR", DestinationColumnName = "Total_Credit_SAR"], [SourceColumnName = "Closing_Balance_SAR", DestinationColumnName = "Closing_Balance_SAR"], [SourceColumnName = "FS_Category", DestinationColumnName = "FS_Category"], [SourceColumnName = "Account_Grouping", DestinationColumnName = "Account_Grouping"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared trial_balance_mapping = let
  Source = SharePoint.Files("https://acwapi.sharepoint.com/sites/FinancialFabricReporting/", [ApiVersion = 15]),
  #"Filtered rows 1" = Table.SelectRows(Source, each Text.EndsWith([Name], "24.xlsx") or Text.EndsWith([Name], "23.xlsx")),
  #"Removed other columns" = Table.SelectColumns(#"Filtered rows 1", {"Content"}),
  #"Added custom" = Table.AddColumn(#"Removed other columns", "Custom", each Excel.Workbook([Content])),
  #"Expanded Custom" = Table.ExpandTableColumn(#"Added custom", "Custom", {"Name", "Data"}, {"Name", "Data"}),
  #"Filtered rows" = Table.SelectRows(#"Expanded Custom", each ([Name] = "Sheet1")),
  #"Removed other columns 1" = Table.Combine(Table.SelectColumns(#"Filtered rows", {"Data"})[Data]),
  #"Filtered rows 2" = Table.SelectRows(#"Removed other columns 1", each [Column3] <> null and [Column3] <> ""),
  #"Promoted headers" = Table.PromoteHeaders(#"Filtered rows 2", [PromoteAllScalars = true]),
  #"Filtered rows 3" = Table.SelectRows(#"Promoted headers", each ([Period Name] <> "Period Name")),
  #"Changed column type" = Table.TransformColumnTypes(#"Filtered rows 3", {{"Entity", Int64.Type}, {"Business Line", Int64.Type}, {"Cost Center", Int64.Type}, {"Project", Int64.Type}, {"Intercompany", type text}, {"Account", type text}, {"Region", type text}, {"Period Name", type date}, {"Opening Balance", type number}, {"Total Debit", type number}, {"Total Credit", type number}, {"Closing Balance", type number}, {"Opening Balance_1", type number}, {"Total Debit_2", type number}, {"Total Credit_3", type number}, {"Closing Balance_4", type number}}),
  #"Renamed columns" = Table.RenameColumns(#"Changed column type", {{"Ledger Name", "Ledger_Name"}, {"Entity", "Entity_Code"}, {"Entity Name", "Entity_Name"}, {"Business Line", "Business_Line_Code"}, {"Business Line Name", "Business_Line_Name"}, {"Cost Center", "Cost_Center_Code"}, {"Cost Center Name", "Cost_Center_Name"}, {"Project", "Project_Code"}, {"Project Name", "Project_Name"}, {"Intercompany", "Intercompany_Code"}, {"Intercompany Name", "Intercompany_Name"}, {"Account", "Account_Code"}, {"Account Name", "Account_Name"}, {"Analytical Code", "Analytical_Code"}, {"Analytical Code Name", "Analytical_Code_Name"}, {"Region", "Region_Code"}, {"Region Description", "Region_Name"}, {"Opening Balance", "Opening_Balance"}, {"Total Debit", "Total_Debit"}, {"Total Credit", "Total_Credit"}, {"Currency", "Currency_Code"}, {"Closing Balance", "Closing_Balance"}, {"Opening Balance_1", "Opening_Balance_SAR"}, {"Total Debit_2", "Total_Debit_SAR"}, {"Total Credit_3", "Total_Credit_SAR"}, {"Closing Balance_4", "Closing_Balance_SAR"}, {" Combination", "UniqueCodeKey"}, {"Period Name", "Period_Name"}}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Renamed columns", {{"Intercompany_Code", Int64.Type}, {"Account_Code", Int64.Type}, {"Region_Code", Int64.Type}}),
  #"Removed columns" = Table.RemoveColumns(#"Changed column type 1", {"Column29"}),
  #"Filtered rows 4" = Table.SelectRows(#"Removed columns", each [UniqueCodeKey] <> null and [UniqueCodeKey] <> ""),
  #"Merged queries" = Table.NestedJoin(#"Filtered rows 4", {"Account_Name"}, fs_mapping, {"Account Name"}, "fs_mapping", JoinKind.LeftOuter),
  #"Expanded fs_mapping" = Table.ExpandTableColumn(#"Merged queries", "fs_mapping", {"FS Category", "Account Grouping"}, {"FS_Category", "Account_Grouping"})
in
  #"Expanded fs_mapping";
shared fs_mapping = let
  Source = SharePoint.Files("https://acwapi.sharepoint.com/sites/FinancialFabricReporting/", [ApiVersion = 15]),
  #"Filtered rows 1" = Table.SelectRows(Source, each Text.EndsWith([Name], "FS Mapping.xlsx")),
  #"Removed other columns" = Table.SelectColumns(#"Filtered rows 1", {"Content"}),
  #"Added custom" = Table.AddColumn(#"Removed other columns", "Custom", each Excel.Workbook([Content])),
  #"Expanded Custom" = Table.ExpandTableColumn(#"Added custom", "Custom", {"Name", "Data"}, {"Name", "Data"}),
  #"Filtered rows" = Table.SelectRows(#"Expanded Custom", each ([Name] = "TB")),
  #"Removed other columns 1" = Table.Combine(Table.SelectColumns(#"Filtered rows", {"Data"})[Data]),
  #"Promoted headers" = Table.PromoteHeaders(#"Removed other columns 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Month", type date}, {"Entity", Int64.Type}, {"Business Line", Int64.Type}, {"Cost Center", Int64.Type}, {"Project", Int64.Type}, {"Intercompany", Int64.Type}, {"Account", Int64.Type}, {"Code", Int64.Type}, {"Region", Int64.Type}, {"Period Name", type date}, {"Opening Balance", type number}, {"Total Debit", type number}, {"Total Credit", type number}, {"Closing Balance", type number}, {"Opening Balance_1", type number}, {"Total Debit_2", type number}, {"Total Credit_3", type number}, {"Closing Balance_4", type number}}),
  #"Choose columns" = Table.SelectColumns(#"Changed column type", {"FS Category", "Account Grouping", "Account Name"}),
  #"Removed duplicates" = Table.Distinct(#"Choose columns", {"FS Category", "Account Grouping", "Account Name"})
in
  #"Removed duplicates";
shared trial_balance_mapping_DataDestination = let
  Pattern = AzureDataExplorer.Contents("https://trd-b0v8e90fdx0fz0gd24.z0.kusto.fabric.microsoft.com", "eventhouse_tb", null, [MaxRows = null, MaxSize = null, NoTruncate = null, AdditionalSetStatements = null]),
  TableNavigation = Pattern{[Name = "trial_balance_mapping"]}?[Data]?
in
  TableNavigation;
