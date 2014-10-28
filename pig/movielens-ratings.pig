/*
 * Normalización tablas Proyecto movielens
 */
            
rawratings = LOAD '/pr/black/del/crm/cli/movielens/ratings' USING PigStorage(' ') AS (userid:int,itemid:int,rating:int,timestamp:long);

-- Validamos que todos los ratings en el rango 1-5
-- normratings = FILTER rawratings BY rating IN (1,2,3,4,5);

store rawratings into '/pr/gray/del/crm/cli/movielens/ratings' USING AvroStorage('','-f hdfs:///pr/app/del/crm/cli/movielens/avro/ratings.avsc');																																																																					