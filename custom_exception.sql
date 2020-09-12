delimiter //
create procedure demofunc2(in id int) 
begin
declare exit handler for SQLEXCEPTION select 'Invalid input' message;
select * from rr;
end //
delimiter ;