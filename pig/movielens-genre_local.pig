/*
 * Normalización tablas Proyecto movielens
 */
            
rawgenre = LOAD 'u.genre' USING PigStorage('|') AS (genre_name:chararray,id:int);

-- Todos los géneros en minúsculas
normgenre = FOREACH rawgenre GENERATE LOWER(genre_name) AS genrename,id;

store normgenre into 'u.genre.avro' USING AvroStorage('','-f file:///home/luis/demos/schema/genre.avrc');