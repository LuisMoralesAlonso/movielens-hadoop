/*
 * Normalización tablas Proyecto movielens
 */
            
rawgenre = LOAD '/pr/black/del/crm/cli/movielens/genre' USING PigStorage('|') AS (genre:chararray,id:int);

-- Todos los géneros en minúsculas
normgenre = FOREACH rawgenre GENERATE LOWER(genre) AS genrename,id;

store normgenre into '/pr/gray/del/crm/cli/movielens/genre' USING AvroStorage('','-f hdfs:///pr/app/del/crm/cli/movielens/avro/genre.avsc');																			