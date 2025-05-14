-- Initial slow query to simulate performance bottleneck
SELECT date,
       SUM(global_active_power * voltage) AS total_energy
FROM power_consumption
WHERE date BETWEEN '2007-01-01' AND '2008-01-01'
  AND global_active_power > 2
  AND sub_metering_1 > 5
GROUP BY date
ORDER BY total_energy DESC
LIMIT 10;

