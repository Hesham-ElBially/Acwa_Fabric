# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "d7eae95f-788c-4a38-8021-4351318c2114",
# META       "default_lakehouse_name": "IIoT_Silver_lakehouse",
# META       "default_lakehouse_workspace_id": "6bd9efc5-5c69-4694-a489-f60abf43b99f",
# META       "known_lakehouses": [
# META         {
# META           "id": "d7eae95f-788c-4a38-8021-4351318c2114"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

#=========================================================================================
# THIS IS to load new streamed files into the lakehouse
#=========================================================================================

import uuid
import time
from datetime import datetime
from pyspark.sql.functions import lit, current_timestamp

# ------------------------------------------
# CONFIG
# ------------------------------------------
# source_folder = "Files/Ingestion/bash52"
source_folder = "Files/iot-raw-data-parquet/bash52/1-min"
target_table = "IIoT_Silver_lakehouse.bash52.iot_bash52"
max_files_per_run = 5000
log_table_v2 = "IIoT_Silver_lakehouse.dbo.ingestion_log_v2"
# ------------------------------------------
# START LOG
# ------------------------------------------
run_id = str(uuid.uuid4())
start_time = time.time()

print(f"▶ Run ID: {run_id}")
print("▶ Starting ingestion...")

status = "Success"
error_message = ""
records_inserted = 0
files_deleted = 0

files_processed = 0

try:
    # ------------------------------------------
    # 1. List files
    # ------------------------------------------
    all_files = mssparkutils.fs.ls(source_folder)
    parquet_files = [f.path for f in all_files if f.name.endswith(".parquet")]

    files_to_process = parquet_files[:max_files_per_run]

    print(f"Total parquet files: {len(parquet_files)}")
    print(f"Processing now: {len(files_to_process)}")

    if len(files_to_process) == 0:
        print("⏳ No new files.")
        files_processed = 0
    else:
        files_processed = len(files_to_process)

        # ------------------------------------------
        # 2. Read data
        # ------------------------------------------
        df = (
            spark.read.format("parquet").load(files_to_process)
                .withColumnRenamed("SignalDate", "signalDate")
                .withColumnRenamed("Value_Number", "value_Number")
                .withColumnRenamed("Value_DateTime", "value_DateTime")
                .withColumnRenamed("Value_Text", "value_Text")
                .withColumnRenamed("Value_Type", "value_Type")
                .withColumnRenamed("SignalDTTM", "signalDTTM")
        )

        # Count records BEFORE writing
        records_inserted = df.count()
        print(f"Records to insert: {records_inserted}")

        # ------------------------------------------
        # 3. Append into target delta table
        # ------------------------------------------
        df.write.format("delta").mode("append").partitionBy("signalDate").saveAsTable(target_table)
        print("✔ Data appended.")

        # ------------------------------------------
        # 4. Delete processed files
        # ------------------------------------------
        for fpath in files_to_process:
            mssparkutils.fs.rm(fpath, recurse=True)
            files_deleted += 1
        
        print(f"✔ Deleted {files_deleted} files.")

except Exception as e:
    status = "Failed"
    error_message = str(e)
    print("❌ ERROR:", e)

# ------------------------------------------
# END TIME + Duration
# ------------------------------------------
end_time_raw = time.time()
duration_seconds = round(end_time_raw - start_time, 2)

start_ts = datetime.fromtimestamp(start_time)
end_ts = datetime.fromtimestamp(end_time_raw)

print(f"⏱ Duration: {duration_seconds} seconds")

# ------------------------------------------
# WRITE LOG TO DELTA TABLE
# ------------------------------------------
spark.sql(f"""
INSERT INTO {log_table_v2} (
    run_id, start_time, end_time, duration_seconds,
    records_inserted, files_processed, files_deleted,
    target_table, status, error_message
)
VALUES (
    '{run_id}',
    '{start_ts}',
    '{end_ts}',
    {duration_seconds},
    {records_inserted},
    {files_processed},
    {files_deleted},
    '{target_table}',
    '{status}',
    '{error_message}'
)
""")

print("📘 Log record inserted into:", log_table_v2)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
