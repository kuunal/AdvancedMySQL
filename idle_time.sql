delimiter //
create procedure get_idletime(in user varchar(244), inout total_idle_time int)
begin
declare idle_id int;
declare idle_time datetime;
declare working_time datetime;
declare total int;
declare is_finished int default 0;
declare c1 cursor for select id, datetimecol from blinfo where mouse=0 and keyboard=0 and user_name = user;
declare continue handler for NOT FOUND set is_finished = 1;
open c1;
custom_loop: loop
	fetch c1 into idle_id, idle_time;
	if is_finished = 1 THEN
		leave custom_loop;
	end if;
	select datetimecol into working_time from blinfo where id>idle_id and user_name= user and (keyboard>0 or mouse>0) limit 1;
	set total_idle_time = total_idle_time + time_to_sec(timediff(working_time, idle_time)); 
end loop custom_loop;
close c1;
select concat_ws('\n','user:',user,'in hour:',round(total_idle_time/(60*60)),'in minute:',(total_idle_time/60),'in seconds:',(total_idle_time)) as idle_info;
end //
delimiter ;

call get_idletime("damodharn21@gmail.com", @total_idle_time);
	set @total_idle_time=0;
	drop procedure get_idletime;
select @total_idle_time;