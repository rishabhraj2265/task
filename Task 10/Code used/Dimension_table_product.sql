
CREATE TABLE IF NOT EXISTS star.dim_product (
  product_key       SERIAL PRIMARY KEY,
  product_category  VARCHAR(50) UNIQUE
);

INSERT INTO star.dim_product (product_category)
SELECT DISTINCT product_category
FROM star.staging_sales
ON CONFLICT (product_category) DO NOTHING;
