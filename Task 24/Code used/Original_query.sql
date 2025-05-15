-- Original_query.sql

SELECT
    payment_type,
    AVG(CAST(fare_amount AS FLOAT)) AS avg_fare,
    AVG(CAST(tip_amount AS FLOAT)) AS avg_tip,
    AVG(CAST(total_amount AS FLOAT)) AS avg_total
FROM yellow_trip_data
WHERE CAST(passenger_count AS FLOAT) > 1
  AND CAST(trip_distance AS FLOAT) > 2.0
  AND CAST(fare_amount AS FLOAT) BETWEEN 5 AND 100
GROUP BY payment_type
ORDER BY avg_total DESC;

