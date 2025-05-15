from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("YellowTaxiTripDataProcessing") \
    .config("spark.driver.memory", "4g") \
    .getOrCreate()

df = spark.read.csv("yellow_tripdata_2023-01.csv", header=True, inferSchema=True)

print("Schema:")
df.printSchema()

print("Sample rows:")
df.show(5)

total_trips = df.count()
print(f"Total trips: {total_trips}")

avg_trip_distance = df.selectExpr("avg(trip_distance)").first()[0]
print(f"Average trip distance: {avg_trip_distance:.2f} miles")

long_trips = df.filter(df.trip_distance > 10)
long_trips_count = long_trips.count()
print(f"Trips over 10 miles: {long_trips_count}")

print("Trip count by payment type:")
df.groupBy("payment_type").count().show()

long_trips.write.csv("output/long_trips_10plus", header=True, mode="overwrite")

spark.stop()

