# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "0025dad5-4ab8-4f25-828c-1ef9a0600fb9",
# META       "default_lakehouse_name": "IIoT_Bronze_lakehouse",
# META       "default_lakehouse_workspace_id": "6bd9efc5-5c69-4694-a489-f60abf43b99f",
# META       "known_lakehouses": [
# META         {
# META           "id": "0025dad5-4ab8-4f25-828c-1ef9a0600fb9"
# META         },
# META         {
# META           "id": "d7eae95f-788c-4a38-8021-4351318c2114"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

from pyspark.sql import SparkSession
from pyspark.sql.functions import sum as _sum, col

# Initialize Spark session
spark = SparkSession.builder.getOrCreate()

# ✅ Your target folder inside the Lakehouse "Files"
lakehouse_path = "Files/dzankeldy/1-min/2025/11"

# List all files (recursively)
file_df = spark.read.format("binaryFile") \
    .option("pathGlobFilter", "*") \
    .option("recursiveFileLookup", "true") \
    .load(lakehouse_path)

# Count number of files
file_count = file_df.count()

# Sum the total size in bytes
total_size_bytes = file_df.agg(_sum(col("length"))).collect()[0][0]

# Convert bytes to GB
total_size_gb = total_size_bytes / (1024**3)

print(f"Total number of files in {lakehouse_path}: {file_count:,} files, this is the size: {total_size_bytes:,} bytes ({total_size_gb:.2f} GB)")

# 538.36 GB | 594,674 file ===>>> 13.61 GB parquet (2.53%) | 1,258,800,564 record ===>>>  GB  (%)
#----------------------------------------------------------------------------------------------------------------
# Total number of files in Files/dzankeldy/1-min/2025/07: 132,046 files, this is the size: ( 52.20 GB) | 125,683,586 record  1.38 GB
# Total number of files in Files/dzankeldy/1-min/2025/08: 287,212 files, this is the size: (318.37 GB) | 742,151,409 record  8.20 GB
# Total number of files in Files/dzankeldy/1-min/2025/10: 175,416 files, this is the size: (167.79 GB) | 390,965,569 record 13.61 GB
# Total number of files in Files/dzankeldy/1-min/2025/11: 259,841 files, this is the size: (250.82 GB) | 584,524,590 record  7.99 GB

# Total number of files in Files/dzankeldy/Historical   :       1 files, this is the size: ( 24.90 GB) | 152,794,733 record  1.48 GB

# MongoDB extraction
#----------------------------------------------------------------------------------------------------------------
# Total number of files in Files/MongoDB/dzankeldy/     :       1 files, this is the size: ( 48.66 GB) | 274,893,764 record  GB

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": false,
# META   "editable": true
# META }

# CELL ********************

# This is to calculate the size of a table in the lakehouse
##############################################################################################
# Replace 'your_delta_table_name' with the actual name of your Delta table in the Lakehouse
# table_name = "IIoT_Silver_Lakehouse.dewa.dewaDDD" 
table_name = "IIoT_Silver_Lakehouse.dzankeldy.iot_dzankeldy"

try:
    # Execute DESCRIBE DETAIL on the Delta table
    df_details = spark.sql(f"DESCRIBE DETAIL {table_name}")

    # Extract the 'sizeInBytes' from the result
    size_in_bytes = df_details.select("sizeInBytes").collect()[0][0]
    record_count_fast = spark.table(table_name).count()

    # Convert size to GB
    size_in_gb = size_in_bytes / (1024 * 1024 * 1024)

    print(f"Record Count: {record_count_fast:,}")
    print(f"The size of Delta table '{table_name}' is: {size_in_gb:.2f} GB")

except Exception as e:
    print(f"An error occurred: {e}")
    print(f"Ensure that the table '{table_name}' exists and is a Delta Lake table.")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": false,
# META   "editable": true
# META }

# CELL ********************

##############################################################################################
# This is to MIGRATE json data to BRONZE lakehouse
##############################################################################################
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, current_timestamp, from_unixtime, to_date, format_number, input_file_name

# ------------------------------------------------------------
# 1️⃣ Initialize Spark Session
# ------------------------------------------------------------
spark = SparkSession.builder.appName("FabricLakehouse_JSON_Ingestion").getOrCreate()

# ------------------------------------------------------------
# 2️⃣ Define Lakehouse folder path (shortcut folder)
# ------------------------------------------------------------
lakehouse_folder = "Files/dzankeldy/1-min/2025/11"

# ------------------------------------------------------------
# 3️⃣ Read JSON files recursively (no need for authentication)
# ------------------------------------------------------------
df = (
    spark.read.format("json")
        .option("recursiveFileLookup", "true")
        .option("multiLine", "false")  # if your JSONs are single-line
        .load(lakehouse_folder)
)
# ➕ Add a column with the file path
df = df.withColumn("source_file_path", input_file_name())

print(f"✅ Raw records loaded: {df.count():,}")

# ------------------------------------------------------------
# 6️⃣ Write cleaned data to a Delta table partitioned by signal_date
# ------------------------------------------------------------
target_table = "IIoT_Bronze_lakehouse.dzankeldy.iot_dzankeldy_11"
(
    df.write
        .format("delta")
        .mode("append")             # use "append" "overwrite" for incremental loads
        .saveAsTable(target_table)
)

print(f"✅ Data successfully written to Lakehouse table: {target_table}")

# ------------------------------------------------------------
# 7️⃣ Validate the write
# ------------------------------------------------------------
# Get total records
# result = spark.sql(f"SELECT COUNT(*) AS total_records FROM {target_table}")

# Format the number with thousand separators
# df_formatted = result.select(format_number(col("total_records"), 0).alias("total_records_formatted"))

# display(df_formatted)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

##############################################################################################
# This is to MIGRATE CSV data to BRONZE lakehouse
##############################################################################################

from pyspark.sql import SparkSession
from pyspark.sql.functions import input_file_name, regexp_extract, col

# Initialize a Spark Session (if not already done)
# spark = SparkSession.builder.appName("MultiCSVtoDelta").getOrCreate()

# --- 1. Define Paths ---
# Use the folder path where your CSV files are located.
# IMPORTANT: Use the wildcard *.csv to read ALL files in the directory.
# Ensure the path is correct for your environment (e.g., Fabric, Databricks, S3).
# Example path based on your previous input:
CSV_FOLDER_PATH = "Files/dzankeldy/Historical"

# --- 2. Read All CSV Files in the Folder ---
print(f"Attempting to read all CSV files from: {CSV_FOLDER_PATH}")

# Read all files matching the pattern, ensuring schema is inferred and headers are used
df = (
    spark.read.format("csv")
        .option("recursiveFileLookup", "true")
        .option("multiLine", "false")  # if your JSONs are single-line
        .option("header", "True")
        .option("inferSchema","True")
        .load(CSV_FOLDER_PATH)
)

print(f"Total number of files loaded: {df.inputFiles().__len__()}")

# --- 3. Add Source Filename Column (Lineage) ---
# input_file_name() returns the full path (e.g., s3a://bucket/folder/file.csv)
# We use regexp_extract to pull just the filename from the end of the path.
df_with_lineage = df.withColumn("source_file_path", input_file_name())

record_count = df.count()
print(f"Total number of records in the CSV: {record_count}")

# --- 4. Write to Lakehouse Table (Delta Format) ---

# Define the destination path for your Delta Lake table
target_table = "IIoT_Bronze_lakehouse.dzankeldy.iot_dzankeldy_csv"
print(f"Writing data to Delta Lake table at: {target_table}")
df_with_lineage.write \
    .format("delta") \
    .mode("overwrite") \
    .option("mergeSchema", "true") \
    .saveAsTable(target_table)

print("✅ Data ingestion complete! The Delta Lake table is ready.")
# To confirm: You can now read the data back using:
# spark.read.format("delta").load(target_table).show(5)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

##############################################################################################
# This is to transform the table another structure JSON DATA
##############################################################################################

from pyspark.sql import SparkSession
from pyspark.sql.functions import from_unixtime, lit, col, split, regexp_replace, to_timestamp, when, unix_timestamp, to_date, date_format, regexp_extract
# 1️⃣ Create Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Enable automatic Delta schema merge
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# 3️⃣ Read the source table
source_table = "IIoT_Bronze_lakehouse.dzankeldy.iot_dzankeldy_11"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = (df.withColumn("signalDTTM", col("ValueDateAndTime").cast("timestamp"))
                .withColumnRenamed("SignalName", "signal")
                .withColumnRenamed("Asset", "asset")
                .withColumnRenamed("Block", "block")
                .withColumnRenamed("Plant", "plant")
                .withColumnRenamed("Section", "section")
            #    .limit(10)
            )

# Split into date and time columns
df_transformed = df_sample.withColumn("signalDate", to_date(col("signalDTTM")))

# 8️⃣ Handle mixed-type 'Value' column
df_transformed = df_transformed.withColumn(
    "value_Number",
    when(col("Value").cast("double").isNotNull(), col("Value").cast("double"))
)

# Convert datetime strings like "10/12/2025 12:35:13 AM"
value_as_string = col("Value").cast("string")
df_transformed = df_transformed.withColumn(
    "value_DateTime",
    when(
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").isNotNull(),
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").cast("timestamp")
    )
)

df_transformed = df_transformed.withColumn(
    "value_Text",
    when(
        (col("value_Number").isNull()) & (col("value_DateTime").isNull()) & (col("Value").isNotNull()),
        col("Value")
    )
)

df_transformed = df_transformed.withColumn(
    "value_Type",
    when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
columns_to_drop = ["Id", "InstrumentID", "Quality_Text", "SignalId", "Timestamp", "source_file_path", "Value", "IsAlarm", "Quality", "Host", "_corrupt_record","ValueDateAndTime"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.dzankeldy.iot_dzankeldy"
#overwrite   append
df_final.write \
     .format("delta") \
     .mode("append") \
     .option("mergeSchema", "true") \
     .option("overwriteSchema", "true") \
     .partitionBy("signalDate") \
     .saveAsTable(target_table)

print(f"✅ Transformation complete — 100 sample rows appended to {target_table} with auto schema merge")
# display(df_final)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

##############################################################################################
# This is to transform the table another structure CSV DATA
##############################################################################################

from pyspark.sql import SparkSession
from pyspark.sql.types import StringType
from pyspark.sql.functions import from_unixtime, lit, col, split, regexp_replace, to_timestamp, when, unix_timestamp, to_date, date_format, regexp_extract
# 1️⃣ Create Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Enable automatic Delta schema merge
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# 3️⃣ Read the source table
source_table = "IIoT_Bronze_Lakehouse.dzankeldy.hist_dzankeldy_mongodb"
df = spark.read.table(source_table)

# Split into date and time columns
df_transformed = (df.withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
                    .withColumnRenamed("SignalName", "signal")
                    .withColumnRenamed("Asset", "asset")
                    .withColumnRenamed("Block", "block")
                    .withColumnRenamed("Plant", "plant")
                    .withColumnRenamed("Section", "section")
                    # .limit(10)
            )
print(f"✅ SignalDTTM created")

df_transformed = df_transformed.withColumn("signalDate", to_date(col("signalDTTM")))
print(f"✅ signalDate created")

# 8️⃣ Handle mixed-type 'Value' column
df_transformed = df_transformed.withColumn("value_Number", when(col("Value").cast("double").isNotNull(), col("Value").cast("double")))

# Convert datetime strings like "10/12/2025 12:35:13 AM"
value_as_string = col("Value").cast("string")
df_transformed = df_transformed.withColumn("value_DateTime",
    when(
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").isNotNull(),
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").cast("timestamp")
    )
)

df_transformed = df_transformed.withColumn("value_Text",
    when(
        (col("value_Number").isNull()) & (col("value_DateTime").isNull()) & (col("Value").isNotNull()),
        col("Value")
    ).otherwise(None).cast(StringType())
)

df_transformed = df_transformed.withColumn("value_Type",
     when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
columns_to_drop = ["_id", "instrumentID", "Quality_Text", "SignalId", "timestamp", "source_file_path", "value", "IsAlarm", "quality", "Host", "_corrupt_record","timeField"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.dzankeldy.iot_dzankeldy"
#overwrite   append
df_final.write \
     .format("delta") \
     .mode("append") \
     .option("mergeSchema", "true") \
     .partitionBy("signalDate") \
     .saveAsTable(target_table)

print(f"✅ Transformation complete — 100 sample rows appended to {target_table} with auto schema merge")
# display(df_final)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from pyspark.sql import functions as F
from pyspark.sql.window import Window
from datetime import datetime

# --------------------------
# Parameters
# --------------------------
source_table = "IIoT_Silver_lakehouse.dzankeldy.iot_dzankeldy"
partition_col = "signalDate"
deduped_table = "IIoT_Silver_lakehouse.dzankeldy.dzankeldy_deduped"

# --------------------------
# Get all partitions
# --------------------------
# Get all unique SignalDate values from the table
partitions = [row[0] for row in spark.table(source_table).select(partition_col).distinct().collect()]
print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Found {len(partitions)}")

# --------------------------
# Loop over partitions
# --------------------------
for partition in partitions:
     # Convert datetime.date to string in YYYY-MM-DD format
    partition_str = partition.strftime("%Y-%m-%d")
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Processing SignalDate = {partition_str}")

    # Load only this partition
    df = spark.table(source_table).filter(F.col(partition_col) == partition_str)
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Load only this partition")

    # Columns to check for duplicates (exclude partition column)
    all_cols = [c for c in df.columns if c != partition_col]
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Columns to check for duplicates (exclude partition column)")

    # Compute a hash for all columns
    df_hashed = df.withColumn("row_hash", F.sha2(F.concat_ws("||", *all_cols), 256))
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Compute a hash for all columns")

    # Deduplicate: keep only one row per hash
    window = Window.partitionBy("row_hash").orderBy(F.lit(1))
    df_deduped = (df_hashed.withColumn("rn", F.row_number().over(window))
                          .filter(F.col("rn") == 1)
                          .drop("rn", "row_hash")  # remove helper columns
    )
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Deduplicate: keep only one row per hash")

    # Write deduplicated data to new table (append partition)
    df_deduped.write.format("delta") \
                     .mode("append") \
                     .partitionBy(partition_col) \
                     .saveAsTable(deduped_table)
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Partition {partition} processed. Unique rows appended.")

print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Deduplication complete. All partitions written to new table.")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.sql("""
    DELETE FROM IIoT_Bronze_lakehouse.dzankeldy.hist_dzankeldy_mongodb
    WHERE to_date(timeField) IN ('2025-07-28','2025-07-29','2025-07-30','2025-07-31','2025-08-01','2025-08-02')
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.sql("""
    INSERT INTO IIoT_Silver_Lakehouse.bash52.iot_bash52 (asset,
			block,
			plant,
			section,
			signalDate,
			signalDTTM,
			signal,
			value_Number,
			value_DateTime,
			value_Text,
			value_Type)
    SELECT asset,
			block,
			plant,
			section,
			SignalDate AS signalDate,
			SignalDTTM AS signalDTTM,
			signal,
			Value_Number AS value_Number,
			Value_DateTime AS value_DateTime,
			Value_Text AS value_Text,
			Value_Type AS value_Type 
    FROM IIoT_Silver_lakehouse.bash.iot_bash52
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
