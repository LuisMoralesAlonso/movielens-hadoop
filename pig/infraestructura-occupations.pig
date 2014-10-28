/*
 * Normalización tablas Infraestructura
 */
            
rawoccupations = LOAD '/pr/black/inf/per/gen/grupos/occupations' AS (occupation:chararray);

SET mapred.output.compress true;
SET mapred.output.compression.codec org.apache.hadoop.io.compress.SnappyCodec;
SET avro.output.codec snappy;

store rawoccupations into '/pr/gray/inf/per/gen/grupos/occupations' USING AvroStorage('','-f hdfs:///pr/app/inf/per/gen/grupos/avro/occupations.avsc');																			