delimiter //
create function get_action() returns char(6)
begin
declare last_tableid int;
declare last_insert_id int;
declare action char(6);
select last_insert_id() into last_insert_id;
select max(id) into last_tableid from dummy_table;
if last_insert_id = last_tableid then
set action = 'UPDATE';
ELSEIF last_insert_id < last_tableid then
set action = 'DELETE';
else set action = 'INSERT';
end if;
return (action);	
end //
delimiter ;
