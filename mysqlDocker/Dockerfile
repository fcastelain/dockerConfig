FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD root

COPY 1-SCHEMA.sql /docker-entrypoint-initdb.d/1-SCHEMA.sql
COPY 2-PRIVILEGES.sql /docker-entrypoint-initdb.d/2-PRIVILEGES.sql
COPY 3-ENTRIES.sql /docker-entrypoint-initdb.d/3-ENTRIES.sql
COPY 4-INDEX.sql /docker-entrypoint-initdb.d/4-INDEX.sql
