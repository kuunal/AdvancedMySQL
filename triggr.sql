
delimiter //
create trigger update_trigger
after update
on dummy_table
for each row
begin
insert into database_status(action) values('UPDATE');
end //
delimiter ;


delimiter //
create trigger insert_trigger
after insert
on dummy_table
for each row
begin
insert into database_status(action) values('INSERT');
end //
delimiter ;


delimiter //
create trigger delete
after |DML
on dummy_table
for each row
begin
insert into database_status(action) values('DELETE');
end //
delimiter ;

delimiter //
create trigger create_trigger
after create on *.*
insert into database_status(action) values('CREATE');
delimiter ;


CREATE EVENT e ON DROP [DO] INSERT INTO db1.t VALUES (5); 
