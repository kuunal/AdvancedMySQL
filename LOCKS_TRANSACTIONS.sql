start transaction;
SAVEPOINT DEMOSP;
insert into t1 values(4);
rollback to SAVEPOINT DEMOSP;
commit


lock table t1 READ;
unlock tables;


lock table t1 WRITE;
unlock tables;

lock table t1 read;
unlock tables;

