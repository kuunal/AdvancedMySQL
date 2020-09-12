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

c1:
 set transaction isolation level serializable;
 start transaction;
 select * from t11;
 
 c2:
 set transaction isolation level serializable;
start transaction;
 insert into t11 values(111,"aas");
 
 
 c1:
 set transaction isolation level reapeatable read;
 start transaction;
 select * from t11;--old snapshot is read
 commit
 
 c2:
 set transaction isolation level reapeatable read;
start transaction;
 insert into t11 values(111,"aas");
 commit
 
  c1:
 set transaction isolation level read committed;
 start transaction;
 select * from t11;--Fresh snapshot is read
 commit
 
 c2:
 set transaction isolation level read committed;
start transaction;
 insert into t11 values(111,"aas");
 commit
 
