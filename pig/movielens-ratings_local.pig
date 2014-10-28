/*
 * Normalización tablas Proyecto movielens
 */
            
rawratings = LOAD 'u.data' AS (userid:int,itemid:int,rating:int,timestamp:long);

-- Validamos que todos los ratings en el rango 1-5
normratings = FILTER rawratings BY rating IN (1,2,3,4,5);

store normratings into 'ratings.data' USING AvroStorage('','-f hdfs:///pr/app/del/crm/cli/movielens/avro/ratings.avsc');																																																																					