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
lakehouse_path = "Files/salalah2/1-min/2025/11"

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

print(f"Total number of files in {lakehouse_path}: {file_count:,} files, this is the size: ({total_size_gb:.2f} GB)")




# 3,191.91 GB | 1,643,233 file ===>>> 109.67 GB parquet 3.44% | 7,002,274,786 record ===>>>  GB  (%)
#---------------------------------------------------------------------------------------------------------------------------------------
# Total number of files in Files/salalah2/1-min/2025/07: 158,158 files, this is the size: (   81.90 GB) |   185,699,416 record   2.00 GB
# Total number of files in Files/salalah2/1-min/2025/08: 482,695 files, this is the size: (  990.75 GB) | 2,171,689,845 record  25.23 GB 
# Total number of files in Files/salalah2/1-min/2025/09: 503,591 files, this is the size: (1,058.99 GB) | 2,320,958,494 record  69.83 GB
# Total number of files in Files/salalah2/1-min/2025/10: 498,789 files, this is the size: (1,060.27 GB) | 2,323,927,031 record 109.67 GB
# Total number of files in Files/salalah2/1-min/2025/11: 509,730 files, this is the size: (1,058.62 GB) | 2,320,333,592 record 148.28 GB
#---------------------------------------------------------------------------------------------------------------------------------------



# History from MongoDB
#--------------------------------------------------------------------------------------------------------------------------------------------------
# MongoDB: 2023 | 5,025,649 files | 1,047.45 GB | 2,168,830,909 Records | Lakehouse size: 20.44 GB (98.05%) 
#==================================================================================================================================================
# Total number of files in Files/SALALAH_II_IPP/2023/3/ : 148,981 files, this is the size : ( 19.54 GB) |  40,543,520 record  0.46 GB |  52,011,450
# Total number of files in Files/SALALAH_II_IPP/2023/4/ : 429,382 files, this is the size : ( 57.34 GB) | 119,190,104 record  1.74 GB | 107,723,404
# Total number of files in Files/SALALAH_II_IPP/2023/5/ : 478,293 files, this is the size : ( 76.78 GB) | 159,240,932 record  3.34 GB | 162,162,953
# Total number of files in Files/SALALAH_II_IPP/2023/6/ : 469,806 files, this is the size : (108.58 GB) | 224,327,330 record  5.40 GB | 221,708,019
# Total number of files in Files/SALALAH_II_IPP/2023/7/ : 549,526 files, this is the size : (125.52 GB) | 259,970,344 record  7.84 GB | 259,672,640
# Total number of files in Files/SALALAH_II_IPP/2023/8/ : 515,734 files, this is the size : (117.25 GB) | 242,748,079 record 10.09 GB | 242,741,843
# Total number of files in Files/SALALAH_II_IPP/2023/9/ : 595,007 files, this is the size : (133.92 GB) | 276,859,037 record 12.64 GB | 276,956,742
# Total number of files in Files/SALALAH_II_IPP/2023/10/: 589,831 files, this is the size : (132.48 GB) | 274,408,914 record 15.16 GB | 274,311,209
# Total number of files in Files/SALALAH_II_IPP/2023/11/: 739,092 files, this is the size : (161.23 GB) | 333,691,619 record 18.19 GB | 333,691,619
# Total number of files in Files/SALALAH_II_IPP/2023/12/: 509,997 files, this is the size : (114.81 GB) | 237,851,030 record 20.44 GB | 237,849,097
# 
# MongoDB: 2024 | 3,361,156 files | 728.79 GB | Records | Lakehouse size: GB (%) 
#==================================================================================================================================================
# Total number of files in Files/SALALAH_II_IPP/2024/1/ : 476,519 files, this is the size : (107.63 GB) | 222,912,543 record 22.46 GB | 222,910,028
# Total number of files in Files/SALALAH_II_IPP/2024/2/ : 278,323 files, this is the size : ( 61.68 GB) | 127,541,665 record 23.72 GB | 127,546,113
# Total number of files in Files/SALALAH_II_IPP/2024/3/ : 260,498 files, this is the size : ( 56.94 GB) | 117,787,465 record 24.93 GB | 117,785,116
# Total number of files in Files/SALALAH_II_IPP/2024/4/ : 250,991 files, this is the size : ( 54.63 GB) | 113,031,349 record 26.08 GB | 113,033,698
# Total number of files in Files/SALALAH_II_IPP/2024/5/ : 251,584 files, this is the size : ( 54.61 GB) | 112,944,384 record 27.25 GB | 112,942,082
# Total number of files in Files/SALALAH_II_IPP/2024/6/ : 208,498 files, this is the size : ( 45.42 GB) |  93,925,194 record 28.19 GB |  93,923,825
# Total number of files in Files/SALALAH_II_IPP/2024/7/ : 262,700 files, this is the size : ( 57.27 GB) | 118,439,865 record 29.36 GB | 118,441,659
# Total number of files in Files/SALALAH_II_IPP/2024/8/ : 272,537 files, this is the size : ( 59.23 GB) | 122,521,605 record 30.55 GB | 122,510,648
# Total number of files in Files/SALALAH_II_IPP/2024/9/ : 258,622 files, this is the size : ( 56.18 GB) | 116,229,175 record 31.67 GB | 116,239,287
# Total number of files in Files/SALALAH_II_IPP/2024/10/: 256,177 files, this is the size : ( 55.59 GB) | 114,983,111 record 32.81 GB | 114,978,059
# Total number of files in Files/SALALAH_II_IPP/2024/11/: 290,707 files, this is the size : ( 60.81 GB) | 125,739,540 record 34.04 GB | 125,739,091
# Total number of files in Files/SALALAH_II_IPP/2024/12/: 294,000 files, this is the size : ( 58.80 GB) | 121,952,904 record 35.24 GB | 121,961,127
# 

# MongoDB: 2025 | 2,845,848 files | 590.16 GB | Records | Lakehouse size:
#====================================================================================================================================
# Total number of files in Files/SALALAH_II_IPP/2025/1/ : 229,837 files, this is the size : ( 45.38 GB) |  94,127,051 record 36.17 GB
# Total number of files in Files/SALALAH_II_IPP/2025/2/ : 236,144 files, this is the size : ( 47.45 GB) |  98,409,039 record 37.12 GB
# Total number of files in Files/SALALAH_II_IPP/2025/3/ : 295,746 files, this is the size : ( 59.05 GB) | 122,462,739 record 38.31 GB
# Total number of files in Files/SALALAH_II_IPP/2025/4/ : 264,454 files, this is the size : ( 57.97 GB) | 120,053,774 record 39.54 GB
# Total number of files in Files/SALALAH_II_IPP/2025/5/ : 273,421 files, this is the size : ( 59.70 GB) | 123,574,452 record 40.80 GB
# Total number of files in Files/SALALAH_II_IPP/2025/6/ : 261,150 files, this is the size : ( 55.49 GB) | 114,760,509 record 41.96 GB
# Total number of files in Files/SALALAH_II_IPP/2025/7/ : 376,828 files, this is the size : ( 83.59 GB) | 173,105,727 record 43.77 GB
# Total number of files in Files/SALALAH_II_IPP/2025/8/ : 299,900 files, this is the size : ( 59.18 GB) | 122,609,691 record 44.96 GB
# Total number of files in Files/SALALAH_II_IPP/2025/9/ : 304,028 files, this is the size : ( 59.61 GB) | 123,468,878 record 46.12 GB
# Total number of files in Files/SALALAH_II_IPP/2025/10/: 304,340 files, this is the size : ( 62.74 GB) | 130,219,341 record 47.35 GB

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
table_name = "IIoT_Bronze_lakehouse.salalah2.iot_salalah2"

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
lakehouse_folder = "Files/salalah2/1-min/2025/11"

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

# ------------------------------------------------------------------
# 6️⃣ Write cleaned data to a Delta table partitioned by signal_date
# ------------------------------------------------------------------
target_table = "IIoT_Bronze_lakehouse.salalah2.iot_salalah2"
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

# display(df)


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
CSV_FOLDER_PATH = "Files/salalah2/Historical"

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
target_table = "IIoT_Bronze_lakehouse.salalah2.iot_salalah2_csv"
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
source_table = "IIoT_Bronze_Lakehouse.salalah2.iot_salalah2"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = (df.filter(col("_corrupt_record").isNull())
                .withColumn("SignalDTTM", col("ValueDateAndTime").cast("timestamp"))
                # .limit(10)
            )

# Split into date and time columns
df_transformed = df_sample.withColumn("SignalDate", to_date(col("SignalDTTM")))

# 8️⃣ Handle mixed-type 'Value' column
df_transformed = df_transformed.withColumn(
    "Value_Number",
    when(col("Value").cast("double").isNotNull(), col("Value").cast("double"))
)

# Convert datetime strings like "10/12/2025 12:35:13 AM"
value_as_string = col("Value").cast("string")
df_transformed = df_transformed.withColumn(
    "Value_DateTime",
    when(
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").isNotNull(),
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").cast("timestamp")
    )
)

df_transformed = df_transformed.withColumn(
    "Value_Text",
    when(
        (col("Value_Number").isNull()) & (col("Value_DateTime").isNull()) & (col("Value").isNotNull()),
        col("Value")
    )
)

df_transformed = df_transformed.withColumn(
    "Value_Type",
    when(col("Value_Number").isNotNull(), lit("Numeric"))
    .when(col("Value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("Value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
columns_to_drop = ["Id", "InstrumentID", "Quality_Text", "SignalId", "Timestamp", "source_file_path", "Value", "IsAlarm", "Quality", "Host", "_corrupt_record"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.salalah2.iot_salalah2"
#overwrite   append
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
source_table = "IIoT_Bronze_Lakehouse.salalah2.iot_salalah2_mongodb"
df = spark.read.table(source_table)

# Split into date and time columns
df_transformed = ( 
    df.withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
    .withColumn("signalDate", to_date(col("SignalDTTM")))
    .withColumnRenamed("Asset", "asset")
    .withColumnRenamed("Block", "block")
    .withColumnRenamed("Planet", "plant")
    .withColumnRenamed("Section", "section")
    .withColumnRenamed("Tag", "signal")
    .filter(col("timestamp") < unix_timestamp(lit("2025-07-10"), "yyyy-MM-dd"))    # <-- Filter here
    # .limit(10)
)

# 8️⃣ Handle mixed-type 'Value' column
df_transformed = df_transformed.withColumn("value_Number", when(col("TagValue").cast("double").isNotNull(), col("TagValue").cast("double")))

# Convert datetime strings like "10/12/2025 12:35:13 AM"
value_as_string = col("TagValue").cast("string")
df_transformed = df_transformed.withColumn("value_DateTime",
    when(
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").isNotNull(),
        unix_timestamp(value_as_string, "MM/dd/yyyy hh:mm:ss a").cast("timestamp")
    )
)

df_transformed = df_transformed.withColumn("value_Text", when((col("value_Number").isNull()) & (col("value_DateTime").isNull()) & (col("TagValue").isNotNull()), col("TagValue")))

df_transformed = df_transformed.withColumn("value_Type",
    when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
columns_to_drop = ["filePath", "id", "ValueDateAndTime", "signal_date", "InstrumentID", "Quality", "Quality_Text", "SignalId", "timestamp", "source_file_path", "TagValue", "IsAlarm", "quality", "host", "_corrupt_record"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.salalah2.iot_salalah2"
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

################################################################################
# Distributed version — parse millions of json files and write to Delta table
# This is to MIGRATE json (MongoDB) data to BRONZE lakehouse
##############################################################################################

from pyspark.sql import SparkSession
from pyspark.sql.types import (
    StructType, StructField, StringType, MapType, LongType, ArrayType
)
from pyspark.sql.functions import (
    input_file_name, col, from_json, explode, element_at,
    to_date, from_unixtime, expr, coalesce, regexp_extract
)

# -------------------------------
# 1. Spark session
# -------------------------------
spark = SparkSession.builder \
    .appName("Distributed_JSON_to_Delta") \
    .getOrCreate()

# OPTIONAL: tune these (set according to your cluster)
spark.conf.set("spark.sql.shuffle.partitions", "400")  # adjust to cluster size
# spark.conf.set("spark.sql.adaptive.enabled", "true")  # recommended if supported

# -------------------------------
# 2. Folder path (recursive)
# -------------------------------
folder_path = "Files/SALALAH_II_IPP/2025/10/"

# -------------------------------
# 3. Read all files recursively as text (one row per file)
#    Note: recursiveFileLookup must appear before .text()
# -------------------------------
df_text = (
    spark.read
        .option("recursiveFileLookup", "true")
        .text(folder_path)
        .withColumn("filePath", input_file_name())
        # Extract everything starting from "/Files"
        .withColumn(
            "filePath",
            regexp_extract(col("filePath"), r"(/Files.*)$", 1)
        )
)
# Count number of files
num_files = df_text.select("filePath").distinct().count()
print(f"📂 Number of files loaded: {num_files}")


# -------------------------------
# 4. Define schema of inner JSON (the JSON that is inside the string array)
#    Adjust types if some fields are not string/long.
# -------------------------------
inner_schema = StructType([
    StructField("fields", MapType(StringType(), StringType()), True),
    StructField("name", StringType(), True),
    StructField("tags", MapType(StringType(), StringType()), True),
    StructField("timestamp", LongType(), True)  # epoch millis or seconds — adjust below
])

# -------------------------------
# 5. Parse outer JSON (array of JSON-encoded strings) and explode
#    - outer: array<string>
#    - elem: each inner JSON-string
#    - js: parsed inner JSON as struct (using inner_schema)
# -------------------------------
df_parsed = (
    df_text
      .withColumn("outer", from_json(col("value"), ArrayType(StringType())))
      .withColumn("elem", explode(col("outer")))
      # sometimes elements are double-escaped; if needed, unescape:
      # .withColumn("elem_unescaped", regexp_replace(col("elem"), '\\\\+"', '"'))
      .withColumn("js", from_json(col("elem"), inner_schema))
      .select(
          col("filePath"),
          col("js.fields").alias("fields"),
          col("js.name").alias("name"),
          col("js.tags").alias("tags"),
          col("js.timestamp").alias("timestamp")
      )
)

# Filter-out rows where parsing failed (js is null)
df_parsed = df_parsed.filter(col("fields").isNotNull() | col("tags").isNotNull() | col("timestamp").isNotNull())

# -------------------------------
# 6. Extract commonly used tag fields and compute dynamic TagValue
#    element_at(map_col, key_col) returns value for dynamic key
# -------------------------------
df_flat = (
    df_parsed
      .withColumn("Asset", col("tags").getItem("Asset/Eqpt Name"))
      .withColumn("Block", col("tags").getItem("Block Name"))
      .withColumn("Planet", col("tags").getItem("Plant Name"))
      .withColumn("Section", col("tags").getItem("Section Name"))
      .withColumn("Tag", col("tags").getItem("Tag Name"))   # dynamic key name
      .withColumn("host", col("tags").getItem("host"))
      .withColumn("id", col("tags").getItem("id"))
      .withColumn("Quality", col("fields").getItem("Quality"))
      # dynamic lookup: element_at(fields, Tag) — safe when Tag is null will yield null
      .withColumn("TagValue", element_at(col("fields"), col("Tag")))
)

# -------------------------------
# 7. Compute signal_date (partition column) from timestamp
#    Determine whether timestamp is in seconds or milliseconds.
#    Here we attempt millis first, else fall back to seconds.
# -------------------------------
# Try interpret as milliseconds -> if > 10^12 it's likely millis; use coalesce to be safe
df_final = (
    df_flat
      .withColumn(
          "signal_date",
          # if timestamp looks like millis (>= 10^12), divide by 1000; else use as seconds
          to_date(
              from_unixtime(
                  expr("""
                    CASE
                      WHEN timestamp IS NULL THEN NULL
                      WHEN timestamp > 1000000000000 THEN cast(timestamp/1000 as BIGINT)
                      ELSE cast(timestamp as BIGINT)
                    END
                  """)
              )
          )
      )
      .select(
          "Asset", "Block", "Planet", "Section",
          "Tag", "host", "id", "timestamp", "Quality", "TagValue", "filePath", "signal_date"
      )
)

# -------------------------------
# 8. Repartition for parallel write (choose a column with high cardinality)
#    Tune the number of partitions to match cluster's executors/core
# -------------------------------
# Example: repartition by signal_date and host (or by host alone)
df_to_write = df_final.repartition(200, col("signal_date"), col("host"))
# You can adjust 200 to a number that fits your cluster.

# -------------------------------
# 9. Write to Delta table (partitioned by signal_date)
# -------------------------------
target_table = "IIoT_Bronze_lakehouse.salalah2.iot_salalah2_MongoDB"

(
    df_to_write.write
      .format("delta")
      .mode("append") # use "append" "overwrite" for incremental loads
      .option("mergeSchema", "true")
      .partitionBy("signal_date")
      .saveAsTable(target_table)
)

print(f"✅ Done: wrote to {target_table}")
record_count = df_to_write.count()
print(f"📊 Number of records to be inserted: {record_count}")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.sql("""
    DELETE FROM IIoT_Silver_lakehouse.salalah2.iot_salalah2
    WHERE signalDate < ('2025-12-01')
""")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
