
CREATE TABLE IF NOT EXISTS star.fact_sales (
  transaction_id   INTEGER PRIMARY KEY,
  date_key         INTEGER NOT NULL REFERENCES star.dim_date(date_key),
  customer_key     INTEGER NOT NULL REFERENCES star.dim_customer(customer_key),
  product_key      INTEGER NOT NULL REFERENCES star.dim_product(product_key),
  quantity         INTEGER,
  price_per_unit   NUMERIC(10,2),
  total_amount     NUMERIC(10,2)
);

INSERT INTO star.fact_sales (transaction_id, date_key, customer_key, product_key, quantity, price_per_unit, total_amount)
SELECT
  s.transaction_id,
  EXTRACT(YEAR FROM s.date)::INT * 10000 +
  EXTRACT(MONTH FROM s.date)::INT * 100 +
  EXTRACT(DAY FROM s.date)::INT AS date_key,
  c.customer_key,
  p.product_key,
  s.quantity,
  s.price_per_unit,
  s.total_amount
FROM star.staging_sales s
JOIN star.dim_customer c ON s.customer_id = c.customer_id
JOIN star.dim_product p ON s.product_category = p.product_category;
