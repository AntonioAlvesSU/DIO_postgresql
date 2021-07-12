CREATE ROLE users NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;
ALTER ROLE users PASSWORD '123';
CREATE ROLE guto LOGIN PASSWORD '123';
DROP ROLE guto;
CREATE ROLE guto LOGIN PASSWORD '123' IN ROLE users;
DROP ROLE guto;
CREATE ROLE guto LOGIN PASSWORD '123' ROLE users;
CREATE ROLE guto LOGIN PASSWORD '123' ROLE users;
____________________________________________________________
CREATE ROLE guto INHERIT LOGIN  PASSWORD '123' IN ROLE users;
GRANT ALL ON TABLE aula TO users;
GRANT CONNECT ON DATABASE DIO_AULA_EXERCICIO TO users;
sELECT pg_database.datname
CREATE ROLE guto LOGIN PASSWORD '123';
CREATE ROLE su LOGIN PASSWORD '123';
__________________________________________________
REVOKE professores FROM su;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM teachers;
REVOKE ALL ON SCHEMA public FROM teachers;
REVOKE ALL ON DATABASE DIO_AULA_EXERCICIO FROM teachers;
____________________________________________________________
select * from aula;
__________________________________________________
verificar situação do banco:

systemctl status postgresql-11

\q 
logout
erafh4

sELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database; (tamanho base)

lsb_release -a (versão)

sudo lshw (verifica hardware)

Com o seguinte comando, o postgresql-9.6 foi desinstalado completamente:
root@kali:~# sudo apt-get --purge remove postgresql-9.6

vá para .. \ PostgreSQL \ 9.0 \ data e abra o arquivo postgresql.conf no editor de texto / bloco de notas.
procure o parâmetro da porta .eg: port = 5433.
edite-o no número da sua porta.
vá para o tipo services. msc e reinicie o serviço postgresql.


http://apt.postgresql.org/pub/repos/apt/bionic-pgdg main

netstat -antp | grep ':5432'

alter user postgres with encrypted password "#informg@1991#"
alter user postgres password "#informg@1991#"
f6f3a4d0

______________
Ubuntu:
pg_lsclusters (lista todos os clusters)
pg_crestecluster <version> <cluster name>
pg_dropcluster <version> <cluster name>
pg_ctlcluster <version> <cluster name> <action>cc

CentOS:
systemctl start postgresql-11
systemctl status postgresql-11
systemctl stop postgresql-11
systemctl restart postgresql-11

binarios postgres
createdb
createuser
dropdb
initdb 
pg_ctl ( start, stop, restart)
pg_basebackup
pd_dump / pg_dumpall extrair a informações como foto horario especícfico
pg_restore
psql
reindecdb
vaccumdb

cluster 
coleção de bancos de dados
as_config --console

liberar acesso ip
postgresql.conf
liberar acesso usuario
pg_hba.conf
criar/editar usuários

Ao editar o pg_hba.conf vc pode ao invés de restart do banco , você pode 
fazer um reload:
pg_ctlcluster 11 aula reload

CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;
ALTER ROLE professores PASSWORD '123';
CREATE ROLE guto LOGIN PASSWORD '123';
DROP ROLE guto;
CREATE ROLE guto LOGIN PASSWORD '123' IN ROLE professores;
CREATE ROLE guto LOGIN PASSWORD '123' ROLE professores;

GRANT ALL ON TABLE aula TO users;
GRANT CONNECT ON DATABASE DIO_AULA_EXERCICIO TO role_spcification users
select * from pg_roles;
\du
Administrando os acessos:
GRANT são priveilegios de acessos 
tabela
coluna
sequence
database
domain
foreign data wrapper
foreign server
function
language
large object
schema
tablespace
type

REVOKE ALL ON ALL TABLES IN SCHEMA [schema] FROM [role];
REVOKE ALL ON SCHEMA [schema] FROM [role];
REVOKE ALL ON DATABASE [database] FROM [role];

DATABASE:
grant {{create | connect | temporary | temp} [,...]| all {privilees]}
on database database_name[,...]
to role_specification[,...][with grant option]

SCHEMA:
grant {{create | usage}[,...]| all {privilees]}
on schema schema_name[,...]
to role_specification[,...][with grant option]

table:
grant {{select|insert|update|delete|truncate|references|trigger}
[,...]| all {privilees]}
on {[table]table_name [,...]|
all tables in schema schema_name [,...]}
to role_specification[,...][with grant option]
______________________________________

alter database teste allow_connections true connection limit 100;




