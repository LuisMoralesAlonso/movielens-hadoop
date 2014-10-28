/*
 * Normalización tablas Infraestructura
 */
            
rawpersonas = LOAD '/pr/black/inf/per/gen/personas/basicos' USING PigStorage('|') AS (id:int,age:int,gender:chararray,occupation:chararray,zipcode:int);

SET mapred.output.compress true;
SET mapred.output.compression.codec org.apache.hadoop.io.compress.SnappyCodec;
SET avro.output.codec snappy;

store rawpersonas into '/pr/gray/inf/per/gen/personas/basicos' USING AvroStorage('','-f hdfs:///pr/app/inf/per/gen/personas/avro/personas.avsc');																			