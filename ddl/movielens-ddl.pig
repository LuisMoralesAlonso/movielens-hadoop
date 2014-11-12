/*
 * Alta HCatalog Proyecto movielens
 */
            
sql CREATE SCHEMA IF NOT EXISTS movielens LOCATION '/pr/gray/del/crm/cli/movielens';

sql CREATE EXTERNAL TABLE IF NOT EXISTS movielens.genre (
	genre	string,
	id	int
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '/pr/gray/del/crm/cli/movielens/genre';
