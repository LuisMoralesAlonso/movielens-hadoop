CREATE SCHEMA IF NOT EXISTS movielens LOCATION '/pr/gray/del/crm/cli/movielens';

CREATE EXTERNAL TABLE IF NOT EXISTS movielens.genre (
	genre	string,
	id	int
) 
COMMENT 'Tabla de géneros cinematográficos'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
LOCATION '/pr/gray/del/crm/cli/movielens/genre'
TBLPROPERTIES ('avro.schema.url'='hdfs://pr/app/del/crm/cli/movielens/genre.avsc');



CREATE EXTERNAL TABLE IF NOT EXISTS movielens.items (
	id	int,
	title string,
	releasedate string,
	videoreleasedate string,
	imdburl string,
	unknown int,
	action int,
	adventure int,
	animation int,
	children int,
	comedy int,
	crime int,
	documentary int,
	drama int,
	fantasy int,
	noir int,
	horror int,
	musical int,
	mistery int,
	romance int,
	scifi int,
	thriller int,
	war int,
	western int
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/pr/gray/del/crm/cli/movielens/items';


CREATE EXTERNAL TABLE IF NOT EXISTS movielens.ratings (
	userid	int,
	itemid	int,
	rating	long,
	timestamp	string
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/pr/gray/del/crm/cli/movielens/ratings';


CREATE EXTERNAL TABLE IF NOT EXISTS movielens.occupations (
	occupation	string
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/pr/gray/del/crm/cli/movielens/occupations';


CREATE EXTERNAL TABLE IF NOT EXISTS movielens.users (
	id	int,
	age	int,
	gender	string,
	occupation	string,
	zipcode int
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/pr/gray/del/crm/cli/movielens/users';