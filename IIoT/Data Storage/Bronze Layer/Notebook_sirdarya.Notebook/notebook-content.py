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
from py4j.java_gateway import java_import

spark = SparkSession.builder.getOrCreate()

# ABSOLUTE best performance: Hadoop FS listStatus
sc = spark.sparkContext
java_import(sc._jvm, "org.apache.hadoop.fs.FileSystem")
java_import(sc._jvm, "org.apache.hadoop.fs.Path")

folder = "Files/redstone/1-min/2025/11"

# Resolve Fabric workspace lakehouse root
full_path = spark._jvm.org.apache.hadoop.fs.Path(folder)
fs = full_path.getFileSystem(sc._jsc.hadoopConfiguration())

# Recursive folder walk
status_list = fs.listStatus(full_path)

total_size = 0
file_count = 0

def process(status):
    global total_size, file_count
    if status.isFile():
        total_size += status.getLen()
        file_count += 1
    else:
        # recursively scan subfolders
        for child in fs.listStatus(status.getPath()):
            process(child)

for s in status_list:
    process(s)

print(f"Total number of files in {folder}: {file_count:,} files, this is the size: ({total_size / (1024**3):.2f} GB)")

# 875.3 GB | 766,827 file ===>>> 41.90 GB parquet (4.79%) | 1,720,220,951 record ===>>>  GB  (%)
#----------------------------------------------------------------------------------------------------------------
# Total number of files in Files/redstone/1-min/2025/07: 427,471 files, this is the size: (237.81 GB) |   476,428,225 record  8.86 GB
# Total number of files in Files/redstone/1-min/2025/08: 251,584 files, this is the size: (553.59 GB) | 1,078,103,410 record 38.67 GB
# Total number of files in Files/redstone/1-min/2025/09:  43,115 files, this is the size: ( 40.40 GB) |    79,502,435 record 40.27 GB
# Total number of files in Files/redstone/1-min/2025/10:  44,657 files, this is the size: ( 43.50 GB) |    86,186,881 record 41.90 GB
# Total number of files in Files/redstone/1-min/2025/11:  96,869 files, this is the size: (100.45 GB) |    81,741,891 record 43.42 GB


# 104.07 GB | 
#----------------------------------------------------------------------------------------------------------------
# Total number of files in Files/SIRDARYA CCPP/2024/4 :  3,625 files, this is the size: ( 0.97 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/5 : 59,967 files, this is the size: (16.08 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/6 : 32,618 files, this is the size: ( 7.86 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/7 : 62,745 files, this is the size: (17.23 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/8 : 59,686 files, this is the size: (16.59 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/9 : 37,407 files, this is the size: (10.05 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/10: 66,358 files, this is the size: (17.77 GB)
# Total number of files in Files/SIRDARYA CCPP/2024/11: 65,249 files, this is the size: (17.52 GB)
# 
# Total number of files in Files/SIRDARYA CCPP/2025/2 : 14,008 files, this is the size: (  3.48 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/3 : 251,856 files, this is the size: ( 55.87 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/4 : 382,726 files, this is the size: ( 83.02 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/5 : 416,353 files, this is the size: ( 92.59 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/6 : 419,012 files, this is the size: ( 89.13 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/7 : 614,877 files, this is the size: (135.45 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/8 : 330,463 files, this is the size: ( 70.39 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/9 :  51,709 files, this is the size: (  9.97 GB)
# Total number of files in Files/SIRDARYA CCPP/2025/10:  53,924 files, this is the size: ( 12.03 GB)
# 
# 

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
table_name = "IIoT_Bronze_lakehouse.sirdarya.iot_sirdarya"

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
lakehouse_folder = "Files/SIRDARYA CCPP/2024/4/22"

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
target_table = "IIoT_Bronze_lakehouse.sirdarya.iot_sirdarya_CPP"
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
CSV_FOLDER_PATH = "Files/sirdarya/Historical"

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
target_table = "IIoT_Bronze_lakehouse.sirdarya.iot_sirdarya_csv"
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
source_table = "IIoT_Bronze_Lakehouse.sirdarya.iot_sirdarya"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = (df.withColumn("signalDTTM", col("ValueDateAndTime").cast("timestamp"))
                .withColumnRenamed("Asset", "asset")
                .withColumnRenamed("Block", "block")
                .withColumnRenamed("Plant", "plant")
                .withColumnRenamed("Section", "section")
                .withColumnRenamed("SignalName", "signal")
                .withColumnRenamed("SignalDTTM", "signalDTTM")
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
target_table = "IIoT_Silver_Lakehouse.sirdarya.iot_sirdarya"
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
from pyspark.sql.functions import from_unixtime, lit, col, split, regexp_replace, to_timestamp, when, unix_timestamp, to_date, date_format, regexp_extract
# 1️⃣ Create Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Enable automatic Delta schema merge
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# 3️⃣ Read the source table
source_table = "IIoT_Bronze_Lakehouse.sirdarya.iot_sirdarya_csv"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
# df_sample = df.limit(1000)
print(f"✅ Sample returned")

# Split into date and time columns
df_transformed = df.withColumn(
    "SignalDTTM",
    from_unixtime(col("timestamp")).cast("timestamp")
)
print(f"✅ SignalDTTM created")

df_transformed = df_transformed.withColumn("SignalDate", to_date(col("SignalDTTM")))
print(f"✅ SignalDate created")

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
columns_to_drop = ["_id", "instrumentID", "Quality_Text", "SignalId", "timestamp", "source_file_path", "value", "IsAlarm", "quality", "Host", "_corrupt_record"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.sirdarya.iot_sirdarya"
#overwrite   append
df_final.write \
     .format("delta") \
     .mode("append") \
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

spark.sql("""
    DELETE FROM IIoT_Bronze_Lakehouse.sirdarya.iot_sirdarya_mongodb
    WHERE to_date(timeField) IN ('2025-11-20','2025-11-21','2025-11-22',
                                        '2025-11-23','2025-11-24','2025-11-25',
                                        '2025-11-26','2025-11-27','2025-11-28',
                                        '2025-11-29')
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.sql("""
    INSERT INTO IIoT_Bronze_Lakehouse.sirdarya.iot_sirdarya_mongodb (instrumentID,
			plant,
			section,
			block,
			asset,
			signal,
			value,
			quality,
			timestamp,
			timeField)
    SELECT instrumentID,
			plant,
			section,
			block,
			asset,
			signal,
			value,
			quality,
			timestamp,
			timeField
    FROM IIoT_Bronze_lakehouse.sirdarya.iot_sirdarya_mongodb_11
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.sql("""
    DELETE FROM IIoT_Silver_lakehouse.dewa.iot_dewa_pt1
    WHERE signalDate IN ('2025-11-27')
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
