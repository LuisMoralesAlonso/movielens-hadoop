/*
 * Normalización tablas Proyecto movielens
 */
            
rawitems = LOAD '/pr/black/del/crm/cli/movielens/items' USING PigStorage('|') AS (id:int,title:chararray,releasedate:chararray,videoreleasedate:chararray,imdburl:chararray,unknown:int,action:int,adventure:int,animation:int,children:int,comedy:int,crime:int,documentary:int,drama:int,fantasy:int,noir:int,horror:int,musical:int,mistery:int,romance:int,scifi:int,thriller:int,war:int,western:int);

-- Normalizamos las fechas a ISO-8601, previo paso por traducir los nombres de los meses
-- Mi máquina trabaja con locale es_ES
semiitems = FOREACH rawitems GENERATE id,title,ToString(ToDate((
	CASE REGEX_EXTRACT(releasedate,'-[a-zA-Z]{3}-',0)
		WHEN '-Jan-' THEN REPLACE(releasedate,'-Jan-','-ene-')
		WHEN '-Feb-' THEN REPLACE(releasedate,'-Feb-','-feb-')
		WHEN '-Mar-' THEN REPLACE(releasedate,'-Mar-','-mar-')
		WHEN '-Apr-' THEN REPLACE(releasedate,'-Apr-','-abr-')
		WHEN '-May-' THEN REPLACE(releasedate,'-May-','-may-')
		WHEN '-Jun-' THEN REPLACE(releasedate,'-Jun-','-jun-')
		WHEN '-Jul-' THEN REPLACE(releasedate,'-Jul-','-jul-')
		WHEN '-Aug-' THEN REPLACE(releasedate,'-Aug-','-ago-')
		WHEN '-Sep-' THEN REPLACE(releasedate,'-Sep-','-sep-')
		WHEN '-Oct-' THEN REPLACE(releasedate,'-Oct-','-oct-')
		WHEN '-Nov-' THEN REPLACE(releasedate,'-Nov-','-nov-')
		WHEN '-Dec-' THEN REPLACE(releasedate,'-Dec-','-dic-')
	END
),'dd-MMM-yyyy')) AS isoreleasedate,ToString(ToDate((
	CASE REGEX_EXTRACT(videoreleasedate,'-[a-zA-Z]{3}-',0)
		WHEN '-Jan-' THEN REPLACE(videoreleasedate,'-Jan-','-ene-')
		WHEN '-Feb-' THEN REPLACE(videoreleasedate,'-Feb-','-feb-')
		WHEN '-Mar-' THEN REPLACE(videoreleasedate,'-Mar-','-mar-')
		WHEN '-Apr-' THEN REPLACE(videoreleasedate,'-Apr-','-abr-')
		WHEN '-May-' THEN REPLACE(videoreleasedate,'-May-','-may-')
		WHEN '-Jun-' THEN REPLACE(videoreleasedate,'-Jun-','-jun-')
		WHEN '-Jul-' THEN REPLACE(videoreleasedate,'-Jul-','-jul-')
		WHEN '-Aug-' THEN REPLACE(videoreleasedate,'-Aug-','-ago-')
		WHEN '-Sep-' THEN REPLACE(videoreleasedate,'-Sep-','-sep-')
		WHEN '-Oct-' THEN REPLACE(videoreleasedate,'-Oct-','-oct-')
		WHEN '-Nov-' THEN REPLACE(videoreleasedate,'-Nov-','-nov-')
		WHEN '-Dec-' THEN REPLACE(videoreleasedate,'-Dec-','-dic-')
	END
),'dd-MMM-yyyy')) AS isovideoreleasedate,imdburl ..;	

store semiitems into '/pr/gray/del/crm/cli/movielens/items' USING AvroStorage('','-f hdfs:///pr/app/del/crm/cli/movielens/avro/items.avsc');																																															