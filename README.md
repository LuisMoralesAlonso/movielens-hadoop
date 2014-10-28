movielens
=========

Ejemplo de uso de las diferentes herramientas de la suite de Hadoop. Como set de datos he usado los de Movielens (http://grouplens.org/datasets/movielens/).

Apache Pig es la principal herramienta a usar en los procesos de ETL/ELT que se desarrollen sobre la plataforma de BigData en BBVA. 

Para completar la funcionalidad de Apache Pig vamos a usar otras herramientas disponibles en la suite de Hadoop:
1.- Apache Flume: ingesta de ficheros.
2.- Apache Sqoop: ingesta de datos desde bbdd RDBMS.
3.- Apache Oozie: orquesta dataflows.
4.- Apache HCatalog: gestión de metadatos.

Este repositorio contiene un ejemplo que ilustra la metodología establecida en BBVA para el trabajo con estas herramientas y se propone una primera versión de normas y buenas prácticas a seguir en los proyectos que se desarrollen con ellas:

1.- Estados por los que van a transitar nuestros datos (Black, Gray, White).
2.- Controles a aplicar en las transiciones entre los diferentes estados. Se definirán normas que aplican a: nombre de los campos, tipos de datos, validaciones, etc
3.- Gestión de metadatos. En nuestro caso sobre HCatalog.

