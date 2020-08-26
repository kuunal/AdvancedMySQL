
--update trigger
delimiter //
create trigger update_trigger
after update
on dummy_table
for each row
begin
insert into database_status(action) values('UPDATE');
end //
delimiter ;
-------------------------------------------------------------------------------------------------------------------

--insert trigger
delimiter //
create trigger insert_trigger
after insert
on dummy_table
for each row
begin
insert into database_status(action) values('INSERT');
end //
delimiter ;
------------------------------------------------------------------------------------------------------------------

--delete trigger
delimiter //
create trigger delete
after delete
on dummy_table
for each row
begin
insert into database_status(action) values('DELETE');
end //
delimiter ;


--dummy event
create event e on schedule at current_timestamp do insert into database_status(dummy_table) values('drop');