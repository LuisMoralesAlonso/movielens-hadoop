/*
 * Normalización tablas Infraestructura
 */
            
rawoccupations = LOAD '/pr/black/inf/per/gen/grupos/occupations' AS (occupation:chararray);

store rawoccupations into '/pr/gray/inf/per/gen/grupos/occupations' USING AvroStorage('','-f hdfs:///pr/app/inf/per/gen/grupos/avro/occupations.avsc');																			