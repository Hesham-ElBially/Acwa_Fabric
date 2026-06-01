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

from pyspark.sql import SparkSession
from pyspark.sql.functions import sum as _sum, col

# Initialize Spark session
spark = SparkSession.builder.getOrCreate()

# ✅ Your target folder inside the Lakehouse "Files"
lakehouse_path = "Files/trends-parquet/noor1/noor1/SCSENG"

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

# 2,758,566,690 record | 975.73 GB ==>> 11.16 GB  (98.86%)
#===========================================================
# Total number of files in Files/trends-parquet/noor1: 40 files, this is the size: 16,490,274,304 bytes (15.36 GB)

# Total number of files in Files/trends-parquet/noor1/noor1/DCSENG: 35 files, this is the size: 401,588,347 bytes (0.37 GB)
# Total number of files in Files/trends-parquet/noor1/noor1/SCSENG: 5 files, this is the size: 16,088,685,957 bytes (14.98 GB)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
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
lakehouse_folder = "Files/trends-parquet/noor1/noor1/SCSENG"

# ------------------------------------------------------------
# 3️⃣ Read JSON files recursively (no need for authentication)
# ------------------------------------------------------------
df = (
    spark.read.format("parquet")
        .option("recursiveFileLookup", "true")
        .option("multiLine", "false")  # if your JSONs are single-line
        .load(lakehouse_folder)
)
# ➕ Add a column with the file path
# df = df.withColumn("source_file_path", input_file_name())

print(f"✅ Raw records loaded: {df.count():,}")




# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# ------------------------------------------------------------
# 6️⃣ Write cleaned data to a Delta table partitioned by signal_date
# ------------------------------------------------------------
target_table = "IIoT_Silver_lakehouse.noor1.iot_noor1_brnz_SCSENG"
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

df = spark.sql("SELECT * FROM IIoT_Silver_lakehouse.noor3.iot_noor3_brnz_dcseng LIMIT 1000")
display(df)

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
source_table = "IIoT_Silver_lakehouse.noor1.iot_noor1_brnz_SCSENG"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = (df.withColumn("signalDTTM", col("timestamp").cast("timestamp"))
               .withColumnRenamed("kks_id", "signal")
               .limit(10)
            )

# Split into date and time columns
df_transformed = df_sample.withColumn("signalDate", to_date(col("signalDTTM")))

# 8️⃣ Handle mixed-type 'Value' column
df_transformed = df_transformed.withColumn(
    "value_Number", 
    when(col("value").cast("double").isNotNull(), col("value").cast("double")))

# Convert datetime strings like "10/12/2025 12:35:13 AM"
value_as_string = col("value").cast("string")
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
        (col("value_Number").isNull()) & (col("value_DateTime").isNull()) & (col("value").isNotNull()),
        col("value")
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
columns_to_drop = ["timestamp", "value"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_lakehouse.noor1.iot_noor1_slvr_SCSENG"
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
source_table = "IIoT_Silver_lakehouse.noor1.iot_noor1_brnz_DCSENG"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing
df_sample = (
    df
    .withColumn(
        "signalDTTM",
        to_timestamp(col("timestamp"), "M/d/yyyy h:mm:ss a")
    )
    .withColumnRenamed("kks_id", "signal")
    # .limit(10)
)

# Split into date and time columns
df_transformed = df_sample.withColumn("signalDate", to_date(col("signalDTTM")))

# 8️⃣ Handle mixed-type 'Value' column
df_transformed = df_transformed.withColumn(
    "value_Number", 
    when(col("value").cast("double").isNotNull(), col("value").cast("double")))

# Convert datetime strings like "10/12/2025 12:35:13 AM"
value_as_string = col("value").cast("string")
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
        (col("value_Number").isNull()) & (col("value_DateTime").isNull()) & (col("value").isNotNull()),
        col("value")
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
columns_to_drop = ["timestamp", "value"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_lakehouse.noor1.iot_noor1_slvr_DCSENG"
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
