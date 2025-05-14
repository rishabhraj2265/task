-- power_consumption schema definition for simulation
DROP TABLE IF EXISTS power_consumption;

CREATE TABLE power_consumption (
    id SERIAL PRIMARY KEY,
    date DATE,
    global_active_power FLOAT,
    global_reactive_power FLOAT,
    voltage FLOAT,
    global_intensity FLOAT,
    sub_metering_1 FLOAT,
    sub_metering_2 FLOAT,
    sub_metering_3 FLOAT
);

