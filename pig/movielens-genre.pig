/*
 * Normalización tablas Proyecto movielens
 */
            
rawgenre = LOAD '/pr/black/del/crm/cli/movielens/genre' USING PigStorage('|') AS (genre:chararray,id:int);

-- Todos los géneros en minúsculas
normgenre = FOREACH rawgenre GENERATE LOWER(genre) AS genrename,id;

SET mapred.output.compress true;
SET mapred.output.compression.codec org.apache.hadoop.io.compress.SnappyCodec;
SET avro.output.codec snappy;

store normgenre into '/pr/gray/del/crm/cli/movielens/genre' USING AvroStorage('','-f hdfs:///pr/app/del/crm/cli/movielens/avro/genre.avsc');																			