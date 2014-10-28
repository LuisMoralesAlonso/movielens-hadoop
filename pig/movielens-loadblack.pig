/*
 * Carga inicial de datos en Black Zone
 * La simulamos desde Pig
 */


fs -mkdir /pr/black/del/crm/cli/movielens/ratings;
fs -mkdir /pr/black/del/crm/cli/movielens/items;
fs -mkdir /pr/black/del/crm/cli/movielens/genre;
fs -mkdir /pr/black/inf/per/gen/personas/basicos;
fs -mkdir /pr/black/inf/per/gen/grupos/occupations;


fs -copyFromLocal u.data /pr/black/del/crm/cli/movielens/ratings;
fs -copyFromLocal u.item /pr/black/del/crm/cli/movielens/items;
fs -copyFromLocal u.genre /pr/black/del/crm/cli/movielens/genre;
fs -copyFromLocal u.user /pr/black/inf/per/gen/personas/basicos;
fs -copyFromLocal u.occupation /pr/black/inf/per/gen/grupos/occupations;
