sql CREATE SCHEMA IF NOT EXISTS movielens LOCATION '/pr/gray/del/crm/cli/movielens';

sql CREATE SCHEMA IF NOT EXISTS personas LOCATION '/pr/gray/inf/per/gen/personas';

sql CREATE SCHEMA IF NOT EXISTS grupos LOCATION '/pr/gray/inf/per/gen/grupos';


sql CREATE EXTERNAL TABLE IF NOT EXISTS movielens.genre
COMMENT 'Tabla de géneros cinematográficos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
WITH SERDEPROPERTIES ('avro.schema.url'='hdfs:///pr/app/del/crm/cli/movielens/avro/genre.avsc')
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION '/pr/gray/del/crm/cli/movielens/genre';

sql CREATE EXTERNAL TABLE IF NOT EXISTS movielens.ratings
COMMENT 'Tabla de ratings de peliculas'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
WITH SERDEPROPERTIES ('avro.schema.url'='hdfs:///pr/app/del/crm/cli/movielens/avro/ratings.avsc')
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION '/pr/gray/del/crm/cli/movielens/ratings';

sql CREATE EXTERNAL TABLE IF NOT EXISTS movielens.items
COMMENT 'Tabla de ratings de peliculas'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
WITH SERDEPROPERTIES ('avro.schema.url'='hdfs:///pr/app/del/crm/cli/movielens/avro/items.avsc')
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION '/pr/gray/del/crm/cli/movielens/items';

sql CREATE EXTERNAL TABLE IF NOT EXISTS personas.basicos
COMMENT 'Informacion basica de personas'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
WITH SERDEPROPERTIES ('avro.schema.url'='hdfs:///pr/app/inf/per/gen/personas/avro/personas.avsc')
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION '/pr/gray/inf/per/gen/personas/basicos';

sql CREATE EXTERNAL TABLE IF NOT EXISTS grupos.occupations
COMMENT 'Informacion basica de grupos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
WITH SERDEPROPERTIES ('avro.schema.url'='hdfs:///pr/app/inf/per/gen/grupos/avro/occupations.avsc')
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION '/pr/gray/inf/per/gen/grupos/occupations';