
CREATE TABLE IF NOT EXISTS star.dim_customer (
  customer_key  SERIAL PRIMARY KEY,
  customer_id   VARCHAR(20) UNIQUE,
  gender        VARCHAR(10),
  age           INTEGER
);

INSERT INTO star.dim_customer (customer_id, gender, age)
SELECT DISTINCT customer_id, gender, age
FROM star.staging_sales
ON CONFLICT (customer_id) DO NOTHING;
