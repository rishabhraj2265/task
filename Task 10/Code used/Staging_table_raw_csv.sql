
CREATE TABLE IF NOT EXISTS star.staging_sales (
  transaction_id   INTEGER,
  date             DATE,
  customer_id      VARCHAR(20),
  gender           VARCHAR(10),
  age              INTEGER,
  product_category VARCHAR(50),
  quantity         INTEGER,
  price_per_unit   NUMERIC(10,2),
  total_amount     NUMERIC(10,2)
);
