
CREATE EXTERNAL TABLE IF NOT EXISTS imdb_reviews (
  review    STRING,
  sentiment STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
   'serialization.format' = ',',
   'field.delim'          = ','
)
STORED AS TEXTFILE
LOCATION 's3://rishabh-reviews/'
TBLPROPERTIES (
  'skip.header.line.count' = '1'
);

