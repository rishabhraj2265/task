-- Indexes added to optimize the slow query
CREATE INDEX idx_date ON power_consumption(date);
CREATE INDEX idx_power ON power_consumption(global_active_power);
CREATE INDEX idx_sub1 ON power_consumption(sub_metering_1);

