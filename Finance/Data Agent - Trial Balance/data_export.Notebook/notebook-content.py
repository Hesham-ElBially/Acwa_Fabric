# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "d5ac8484-df1f-4f91-a049-d02dd0e02461",
# META       "default_lakehouse_name": "lakehouse_tb",
# META       "default_lakehouse_workspace_id": "e2a25230-9fe1-4608-8c6b-1abae78c86ab",
# META       "known_lakehouses": [
# META         {
# META           "id": "d5ac8484-df1f-4f91-a049-d02dd0e02461"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

df = spark.sql("SELECT * FROM lakehouse_tb.trial_balance_mapping")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

output_path = "/lakehouse/default/Files/lakehouse_data_export.csv"

df.write.mode("overwrite").option("header", True).csv(output_path)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

Files

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Convert to Pandas DataFrame for Excel/CSV export
df_pandas = df_spark.toPandas()

df_pandas.shape

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import pandas as pd

# Export to Excel file in Fabric Files
excel_path = "/lakehouse/default/Files/lakehouse_data_export.xlsx"
df_pandas.to_excel(excel_path, index=False)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import pandas as pd

# Export to Excel file in Fabric Files
excel_path = "/lakehouse/default/Files/lakehouse_data_export.xlsx"
df_pandas.head(5).to_excel(excel_path, index=False)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import pandas as pd

# Example: Create or use an existing DataFrame
df = pd.DataFrame({
    'Name': ['Alice', 'Bob'],
    'Age': [25, 30]
})

# Save to Excel (in the workspace default storage or local path)
df.to_excel('/lakehouse/default/Files/my_output.xlsx', index=False)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

abfs_path = "abfss://Finance@onelake.dfs.fabric.microsoft.com/lakehouse_tb.Lakehouse/Files/export/sample.xlsx"

df_pandas.head(5).to_excel(abfs_path)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import os

# List files under the Lakehouse Files directory
os.listdir('/lakehouse/default/Files/export')

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from notebookutils import mssparkutils

# This forces Fabric to refresh the Files metadata
mssparkutils.fs.refreshMounts()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
