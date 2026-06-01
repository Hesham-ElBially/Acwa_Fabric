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
lakehouse_path = "Files/DEWA/PT3/1-min/2025/11/"

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

# 3,402.32 GB | 6,468,452 file ===>>> 144.13 GB parquet (4.24%) | 11,013,215,825 record
###############################################################################################################################################
# 647.64 GB | 1,826,703 file | 4,994,145,338 signal | 4,994,145,338     (8.83 GB)
#----------------------------------------------------------------------------------------------------------
# Total number of files in Files/DEWA/CT/1-min/2025/08/ :   231,618 files, this is the size: (201.52 GB) |   397,539,623 record
# Total number of files in Files/DEWA/CT/1-min/2025/09/ :   155,975 files, this is the size: (146.35 GB) |   288,493,392 record
# Total number of files in Files/DEWA/CT/1-min/2025/10/ : 1,439,110 files, this is the size: (299.77 GB) | 2,054,492,758 record 
# Total number of files in Files/DEWA/CT/1-min/2025/11/ : 1,695,698 files, this is the size: (265.46 GB) | 2,253,619,565 record 63.46 GB

# 1,135.94 GB | 2,190,026 file | 6,695,437,999 signal | 
#----------------------------------------------------------------------------------------------------------
# Total number of files in Files/DEWA/PT1/1-min/2025/08/:   505,634 files, this is the size: (446.16 GB) |   914,007,313 record 19.49 GB
# Total number of files in Files/DEWA/PT1/1-min/2025/09/:   469,083 files, this is the size: (351.83 GB) |   721,509,219 record 34.21 GB
# Total number of files in Files/DEWA/PT1/1-min/2025/10/: 1,215,309 files, this is the size: (337.95 GB) | 2,321,254,999 record 59.92 GB
# Total number of files in Files/DEWA/PT1/1-min/2025/11/: 1,623,743 files, this is the size: (317.87 GB) | 2,790,319,666 record 89.31 GB

# 707.22 GB | 1,054,390 file | 3,246,467,968 signal | 3,246,467,968
#---------------------------------------------------------------------------------------------------------
# Total number of files in Files/DEWA/PT2/1-min/2025/08/:   370,129 files, this is the size: (311.26 GB) |   636,504,677 record 14.73 GB
# Total number of files in Files/DEWA/PT2/1-min/2025/09/:   376,591 files, this is the size: (282.47 GB) |   577,547,677 record 28.53 GB
# Total number of files in Files/DEWA/PT2/1-min/2025/10/:   307,670 files, this is the size: (113.49 GB) |   729,950,417 record 38.45 GB
# Total number of files in Files/DEWA/PT2/1-min/2025/11/:   839,024 files, this is the size: (160.74 GB) | 1,302,465,197 record 53.82 GB

# 911.52 GB | 1,397,333 file | 3,724,245,751 signal | 3,724,245,751
#---------------------------------------------------------------------------------------------------------
# Total number of files in Files/DEWA/PT3/1-min/2025/08/:   534,215 files, this is the size: (443.99 GB) |   906,698,657 record 21.79 GB
# Total number of files in Files/DEWA/PT3/1-min/2025/09/:   505,111 files, this is the size: (350.48 GB) |   715,743,317 record 40.21 GB
# Total number of files in Files/DEWA/PT3/1-min/2025/10/:   358,007 files, this is the size: (117.05 GB) |   749,473,776 record 50.25 GB
# Total number of files in Files/DEWA/PT3/1-min/2025/11/:   615,169 files, this is the size: (157.11 GB) | 1,352,330,001 record 65.52 GB

##########################################################################################################################################################

# 1,471.59 GB | 32 file ===>>> 54.12 GB parquet  3.7%  for 13,765,713,239 records  72.57 GB
#----------------------------------------------------------------------------------------------------------------------
# Total number of files in Files/DEWA/Historical/CT /   :   8 files, (324.18 GB)  12.23 GB    2,917,399,764
# Total number of files in Files/DEWA/Historical/PT1/   :   8 files, (408.51 GB)  54.12 GB    3,823,095,898
# Total number of files in Files/DEWA/Historical/PT2/   :   8 files, (346.84 GB)  24.93 GB    3,299,116,163
# Total number of files in Files/DEWA/Historical/PT3/   :   8 files, (392.06 GB)  38.91 GB    3,726,101,414

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
table_name = "IIoT_Bronze_Lakehouse.dewa.iot_dewa_csv_simplified"

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

# The size of Delta table 'IIoT_Bronze_lakehouse.dewa.iot_dewa' is: 144.13 GB
# The size of Delta table 'IIoT_Silver_lakehouse.dewa.dewa' is: 35.32 GB

# The size of Delta table 'IIoT_Silver_lakehouse.dewa.iot_dewa_CT' is: 22.56 GB

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
lakehouse_folder = "Files/DEWA/CT/1-min/2025/10/"

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
target_table = "dewa.IoT_DEWA_CT"
(
    df.write
        .format("delta")
        .mode("append")             # use "append" for incremental loads
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
# This is to migrate from BRONZE to SILVER
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
source_table = "IIoT_Bronze_Lakehouse.dewa.iot_dewa_pt3"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing


# 5️⃣ --- EXTRACTION LOGIC ---
# Regex to extract the Plant Segment (e.g., PT1, PT3) from the source_file_path column.
# Pattern: Looks for /DEWA/ followed by one or more non-slash characters (captured in group 1), followed by /1-min.
# PLANT_SEGMENT_REGEX = r'\/DEWA\/([^\/]+)\/1-min'
# CAPTURE_GROUP_INDEX = 1

# df_transformed = df.withColumn("plant", regexp_extract(col("source_file_path"), PLANT_SEGMENT_REGEX, CAPTURE_GROUP_INDEX))

# Split into date and time columns
df_transformed = df.withColumn("signalDate", to_date(from_unixtime(col("timestamp")).cast("timestamp")))
                
df_transformed = ( df_transformed
                            .filter(col("signalDate") < "2025-10-09")
                            .withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
                            # .limit(10)
)
#################################################################
# df_transformed = df_transformed.filter(col("plant") == "ct")
# df_transformed = df_transformed.filter(col("SignalDate") == to_date(lit("2025-10-09"), "yyyy-MM-dd")

# filter(col("SignalDate").between(
#                     to_date(lit("2025-10-01"), "yyyy-MM-dd"),
#                     to_date(lit("2025-10-08"), "yyyy-MM-dd")
#                 )
            # )         
# ################################################################

# 3️⃣ Split by dot (.)
df_transformed = df_transformed \
    .withColumn("plant",   split(col("Id"), "\.").getItem(0)) \
    .withColumn("section", split(col("Id"), "\.").getItem(1)) \
    .withColumn("block",   split(col("Id"), "\.").getItem(2)) \
    .withColumn("asset",   split(col("Id"), "\.").getItem(3)) \
    .withColumn("signal",  split(split(col("Id"), "\.").getItem(4), "_").getItem(0)) \
    

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
    )
)

df_transformed = df_transformed.withColumn("value_Type",
    when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
# 
columns_to_drop = ["Id", "Quality_Text", "SignalId", "Timestamp", "Value", "IsAlarm", "Quality", "Host", "SignalName", "source_file_path", "ValueDateAndTime","InstrumentID"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.dewa.iot_dewa_pt3"
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
# This is to migrate from BRONZE to SILVER
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
source_table = "IIoT_Bronze_Lakehouse.dewa.iot_dewa_pt3"
df = spark.read.table(source_table)

# 4️⃣ Take only top 100 records for testing


# 5️⃣ --- EXTRACTION LOGIC ---
# Regex to extract the Plant Segment (e.g., PT1, PT3) from the source_file_path column.
# Pattern: Looks for /DEWA/ followed by one or more non-slash characters (captured in group 1), followed by /1-min.
# PLANT_SEGMENT_REGEX = r'\/DEWA\/([^\/]+)\/1-min'
# CAPTURE_GROUP_INDEX = 1

# df_transformed = df.withColumn("plant", regexp_extract(col("source_file_path"), PLANT_SEGMENT_REGEX, CAPTURE_GROUP_INDEX))

# Split into date and time columns
df_transformed = df.withColumn("signalDate", to_date(from_unixtime(col("timestamp")).cast("timestamp")))
                
df_transformed = ( df_transformed
                            .filter(col("signalDate") > "2025-10-05")
                            .filter(col("Id").like("%1sec%"))
                            .withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
                            # .limit(10)
)
#################################################################
# df_transformed = df_transformed.filter(col("plant") == "ct")
# df_transformed = df_transformed.filter(col("SignalDate") == to_date(lit("2025-10-09"), "yyyy-MM-dd")

# filter(col("SignalDate").between(
#                     to_date(lit("2025-10-01"), "yyyy-MM-dd"),
#                     to_date(lit("2025-10-08"), "yyyy-MM-dd")
#                 )
            # )         
# ################################################################

# 3️⃣ Split by dot (.)
df_transformed = df_transformed \
    .withColumn("plant",  split(split(col("Id"), "\.").getItem(0), "=").getItem(1)) \
    .withColumn("section", split(col("Id"), "\.").getItem(1)) \
    .withColumn("signal",  split(split(col("Id"), "\.").getItem(2), "_").getItem(0)) \
    .withColumn("block",   lit(None)) \
    .withColumn("asset",   lit(None))
    
    

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
    )
)

df_transformed = df_transformed.withColumn("value_Type",
    when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
# 
columns_to_drop = ["Id", "Quality_Text", "SignalId", "Timestamp", "Value", "IsAlarm", "Quality", "Host", "SignalName", "source_file_path", "ValueDateAndTime","InstrumentID"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.dewa.iot_dewa_pt3"
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
# This is to migrate from BRONZE to SILVER
##############################################################################################

from pyspark.sql import SparkSession
from pyspark.sql.functions import from_unixtime, lit, col, split, regexp_replace, to_timestamp, when, unix_timestamp, to_date, date_format, regexp_extract, concat_ws
# 1️⃣ Create Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Enable automatic Delta schema merge
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# 3️⃣ Read the source table
source_table = "IIoT_Bronze_Lakehouse.dewa.iot_dewa_pt3"
df = spark.read.table(source_table)

# Split into date and time columns
df_transformed = df.withColumn("signalDate", to_date(from_unixtime(col("timestamp")).cast("timestamp")))
                
df_transformed = ( df_transformed
                            .filter(col("signalDate") > "2025-10-05")
                            .filter(~col("Id").like("%1sec%"))
                            .withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
                            # .limit(10)
)

# 3️⃣ Split by dot (.)
df_transformed = df_transformed \
    .withColumn("plant",  split(split(col("Id"), "\.").getItem(0), "=").getItem(1)) \
    .withColumn("section", split(col("Id"), "\.").getItem(1)) \
    .withColumn("block",   split(col("Id"), "\.").getItem(2)) \
    .withColumn("asset",   split(col("Id"), "\.").getItem(3)) \
    .withColumn("raw_sig", split(col("Id"), "\.").getItem(4)) \
    .withColumn("parts", split(col("raw_sig"), "_")) \
    .withColumn("signal", concat_ws("_", col("parts")[0], col("parts")[1], col("parts")[2])) \
    .drop("parts", "raw_sig")

# s=Dewa_CSP_EMR_CT .CT .BOP    .PLC1_CTL31_C031_Piping_40WMS15BR001-REGULAT TEMP   .43SBA31GH001_C031_XE04_1763133120    

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
    )
)

df_transformed = df_transformed.withColumn("value_Type",
    when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
# 
columns_to_drop = ["_Id", "Quality_Text", "SignalId", "Timestamp", "Value", "IsAlarm", "Quality", "Host", "SignalName", "source_file_path", "ValueDateAndTime","InstrumentID"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Silver_Lakehouse.dewa.iot_dewa_pt3"
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

spark.sql("""
    INSERT INTO IIoT_Silver_Lakehouse.dewa.iot_dewa_pt3 (
			asset,
			block,
			plant,
			section,
			signalDate,
			signalDTTM,
			signal,
			value_Number,
			value_DateTime,
			value_Text,
			value_Type
		)
    SELECT  asset,
			block,
			plant,
			section,
			signalDate,
			signalDTTM,
			signal,
			value_Number,
			value_DateTime,
			value_Text,
			value_Type
    FROM    IIoT_Bronze_Lakehouse.dewa.iot_dewa_csv_simplified
	WHERE srcPlant = 'PT3'
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.sql("""
    DELETE FROM IIoT_Silver_lakehouse.dewa.iot_dewa_pt3
    WHERE signalDate < '2025-08-01'
""")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

##############################################################################################
# This is to migrate from BRONZE to SILVER
##############################################################################################

from pyspark.sql import SparkSession
from pyspark.sql.functions import from_unixtime, lit, col, split, regexp_replace, to_timestamp, when, unix_timestamp, to_date, date_format, regexp_extract, concat_ws
# 1️⃣ Create Spark session
spark = SparkSession.builder.getOrCreate()

# 2️⃣ Enable automatic Delta schema merge
spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
spark.conf.set("spark.sql.legacy.timeParserPolicy", "LEGACY")
spark.conf.set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")

# 3️⃣ Read the source table
source_table = "IIoT_Bronze_Lakehouse.dewa.iot_dewa_csv"
df = spark.read.table(source_table)

# Split into date and time columns
df_transformed = df.withColumn("signalDate", to_date(from_unixtime(col("timestamp")).cast("timestamp")))
                
df_transformed = ( df_transformed
                            # .filter(col("signalDate") > "2025-10-05")
                            # .filter(~col("Id").like("%1sec%"))
                            .withColumn("signalDTTM", from_unixtime(col("timestamp")).cast("timestamp"))
                            # .limit(10)
)

# 3️⃣ Split by dot (.)
df_transformed = df_transformed \
    .withColumn("plant",   split(col("instrumentID"), "\.").getItem(0)) \
    .withColumn("section", split(col("instrumentID"), "\.").getItem(1)) \
    .withColumn("block",   split(col("instrumentID"), "\.").getItem(2)) \
    .withColumn("asset",   split(col("instrumentID"), "\.").getItem(3)) \
    .withColumn("signal",  split(col("instrumentID"), "\.").getItem(4)) \
    .withColumn("srcPlant",  split(col("source_file_path"), "\/").getItem(7))

# s=Dewa_CSP_EMR_CT .CT .BOP    .PLC1_CTL31_C031_Piping_40WMS15BR001-REGULAT TEMP   .43SBA31GH001_C031_XE04_1763133120    

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
    )
)

df_transformed = df_transformed.withColumn("value_Type",
    when(col("value_Number").isNotNull(), lit("Numeric"))
    .when(col("value_DateTime").isNotNull(), lit("Datetime"))
    .when(col("value_Text").isNotNull(), lit("String"))
    .otherwise(lit(None))
)
# 9️⃣ Drop unwanted columns
# 
columns_to_drop = ["source_file_path","timeField", "Quality_Text", "SignalId", "timestamp", "value", "IsAlarm", "quality", "Host", "SignalName", "ValueDateAndTime","instrumentID"]
df_final = df_transformed.drop(*[c for c in columns_to_drop if c in df_transformed.columns])

#🔟 Write the transformed data to the Lakehouse table with schema merge
target_table = "IIoT_Bronze_Lakehouse.dewa.iot_dewa_csv_simplified"
# overwrite   append
df_final.write \
     .format("delta") \
     .mode("overwrite") \
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
