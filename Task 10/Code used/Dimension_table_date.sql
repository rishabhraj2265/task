
CREATE TABLE IF NOT EXISTS star.dim_date (
  date_key   INTEGER PRIMARY KEY,
  date       DATE NOT NULL,
  day        SMALLINT NOT NULL,
  month      SMALLINT NOT NULL,
  year       INTEGER NOT NULL,
  quarter    SMALLINT NOT NULL
);

INSERT INTO star.dim_date (date_key, date, day, month, year, quarter)
SELECT DISTINCT
  EXTRACT(YEAR FROM date)::INT * 10000 +
  EXTRACT(MONTH FROM date)::INT * 100 +
  EXTRACT(DAY FROM date)::INT AS date_key,
  date,
  EXTRACT(DAY FROM date)::SMALLINT,
  EXTRACT(MONTH FROM date)::SMALLINT,
  EXTRACT(YEAR FROM date)::INT,
  EXTRACT(QUARTER FROM date)::SMALLINT
FROM star.staging_sales
ON CONFLICT (date_key) DO NOTHING;
