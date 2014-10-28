/*
 * Normalización tablas Infraestructura
 */
            
rawpersonas = LOAD '/pr/black/inf/per/gen/personas/basicos' USING PigStorage('|') AS (id:int,age:int,gender:chararray,occupation:chararray,zipcode:int);

store rawpersonas into '/pr/gray/inf/per/gen/personas/basicos' USING AvroStorage('','-f hdfs:///pr/app/inf/per/gen/personas/avro/personas.avsc');																			