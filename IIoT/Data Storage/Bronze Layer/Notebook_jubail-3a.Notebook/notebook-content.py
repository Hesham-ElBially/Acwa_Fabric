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
lakehouse_path = "Files/jubail-3a/Historical"

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

# jubail-3a/1-min/      13.65 GiB   41,731 file
# jubail-3a/Data/
# jubail-3a/Signals/    1.71 GiB       272 file
# 

# 13.65 GB | 41,731 file ===>>> 0.52 GB parquet (3.81%) | 31,409,199 record ===>>>  GB  (%)
#-------------------------------------------------------------------------------------------------------------------------------
# Total number of files in Files/jubail-3a/1-min/2025/07: 41,731 files, this is the size: ( 13.65 GB) |    31,409,199 record  0.52 GB

# Total number of files in Files/jubail-3a/Historical   :      5 files, this is the size: (448.44 GB) | 2,816,045,057 record 29.82 GB


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
table_name = "IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a"

try:
    # Execute DESCRIBE DETAIL on the Delta table
    df_details = spark.sql(f"DESCRIBE DETAIL {table_name}")

    # Extract the 'sizeInBytes' from the result
    size_in_bytes = df_details.select("sizeInBytes").collect()[0][0]

    # Convert size to GB
    size_in_gb = size_in_bytes / (1024 * 1024 * 1024)

    print(f"The size of Delta table '{table_name}' is: {size_in_gb:.2f} GB")

except Exception as e:
    print(f"An error occurred: {e}")
    print(f"Ensure that the table '{table_name}' exists and is a Delta Lake table.")

# The size of Delta table 'IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a_' is: 9.07 GB    
# The size of Delta table 'IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a'  is: 9.81 GB

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
lakehouse_folder = "Files/jubail-3a/1-min/2025/07"

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
target_table = "IIoT_Bronze_lakehouse.jubail3a.iot_jubail3a"
(
    df.write
        .format("delta")
        .mode("overwrite")             # use "append" "overwrite" for incremental loads
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
CSV_FOLDER_PATH = "Files/jubail-3a/Historical"

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
target_table = "IIoT_Bronze_lakehouse.jubail3a.iot_jubail3a_csv"
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
# This is to transform the table from BRONZE to SILVER layer
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
source_table = "IIoT_Bronze_Lakehouse.jubail3a.iot_jubail3a"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = (df
# .filter(col("_corrupt_record").isNull())
                .withColumn("signalDTTM", col("ValueDateAndTime").cast("timestamp"))
                .withColumnRenamed("SignalName", "signal")
                .withColumnRenamed("Asset", "asset")
                .withColumnRenamed("Block", "block")
                .withColumnRenamed("Plant", "plant")
                .withColumnRenamed("Section", "section")
                # .limit(10)
            )

# Split into date and time columns
df_transformed = df_sample.withColumn("signalDate", to_date(col("SignalDTTM")))

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
        (col("Value_Number").isNull()) & (col("Value_DateTime").isNull()) & (col("Value").isNotNull()),
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
columns_to_drop = ["Id", "InstrumentID", "Quality_Text", "SignalId", "SignalName", "Timestamp", "source_file_path", "Value", "IsAlarm", "Quality", "Host", "_corrupt_record","ValueDateAndTime"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a"
# overwrite   append
df_final.write \
     .format("delta") \
     .mode("overwrite") \
     .option("mergeSchema", "true") \
     .option("overwriteSchema", "true") \
     .partitionBy("SignalDate") \
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
from pyspark.sql.functions import from_unixtime, lit, col, split, regexp_replace, to_timestamp, when, unix_timestamp, to_date, date_format, regexp_extract
# 1️⃣ Create Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Enable automatic Delta schema merge
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# 3️⃣ Read the source table
source_table = "IIoT_Bronze_Lakehouse.jubail3a.iot_jubail3a_csv"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = df#.limit(10)
# print(f"✅ Sample returned")

# Split into date and time columns
df_transformed = df_sample.withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
print(f"✅ SignalDTTM created")

df_transformed = df_transformed.withColumn("signalDate", to_date(col("SignalDTTM")))
print(f"✅ SignalDate created")

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
columns_to_drop = ["_id", "instrumentID", "Quality_Text", "SignalId", "timestamp", "source_file_path", "value", "IsAlarm", "quality", "Host", "_corrupt_record"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a"
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
# Remove full-record duplicates and write optimized Delta table (one file per SignalDate)
##############################################################################################
from pyspark.sql import SparkSession, functions as F

# 1️⃣ Initialize Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Configurations for performance and schema handling
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# --- Performance tuning ---
spark.conf.set("spark.sql.adaptive.enabled", "true")                     # Adaptive query execution
# spark.conf.set("spark.sql.adaptive.shuffle.targetPostShuffleInputSize", "256MB")
# spark.conf.set("spark.sql.files.maxPartitionBytes", "1g")                # Larger partition chunks
# spark.conf.set("spark.sql.shuffle.partitions", "200")                    # Tune based on cluster size
spark.conf.set("spark.sql.parquet.compression.codec", "gzip")            # Better compression ratio

# 3️⃣ Read source table
source_table = "IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a_"
df = spark.read.table(source_table)

# 4️⃣ Remove full-record duplicates
df_distinct = df.dropDuplicates()

# 5️⃣ Determine optimal number of partitions (based on distinct SignalDate)
signal_dates = df_distinct.select("SignalDate").distinct().count()
print(f"🧭 Found {signal_dates} unique SignalDate partitions")

# Repartition by SignalDate — ensures one shuffle per date
df_partitioned = df_distinct.repartition(signal_dates, "SignalDate")

# 6️⃣ Write deduplicated data back as optimized Delta table
target_table = "IIoT_Silver_Lakehouse.jubail3a.iot_jubail3a_gzip_"

df_partitioned.write \
    .format("delta") \
    .mode("overwrite") \
    .option("mergeSchema", "true") \
    .option("overwriteSchema", "true") \
    .partitionBy("SignalDate") \
    .saveAsTable(target_table)

print(f"✅ Deduplication complete — results saved to {target_table}")

# 7️⃣ (Optional) Compact Delta files per partition if supported
try:
    spark.sql(f"OPTIMIZE {target_table}")
    print("💾 Table optimized successfully (one file per partition)")
except Exception as e:
    print("ℹ️ OPTIMIZE not supported in this environment — skipping compaction step")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
