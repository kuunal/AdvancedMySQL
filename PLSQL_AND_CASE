Basic Syntax FOR CASE:
CASE value
   WHEN value1 THEN result1
   WHEN value2 THEN result2
   …
   [ELSE else_result]
END
-------------------------------------------------------------------------------------------------------------------
CASE INSIDE OF QUEERY:

select (select distinct username from users where id = o.user_id), case
when quantity > 3
then "you have earned coupon" 
when quantity > 5
then "you have earned cashback"
else "Purchase more items to earn discount or coupon"
end
from orders o;
-------------------------------------------------------------------------------------------------------------------
PROCEDURE USING CASE:

delimiter //
create procedure delivery_time(in id int, out time varchar(199))
begin
declare cust_country varchar(222);
select country into cust_country from customers where customerNumber=id;
case cust_country
	when 'USA' then
	set time = '2 days';
	when 'CANADA' then
	set time = '4 days';
	else set time = '7 days';
end case;
end //
delimiter ;
-------------------------------------------------------------------------------------------------------------------
	PROCEDURE USING CASE:
	
	delimiter //
	create procedure delivery_time2(in id int, out time varchar(199))
	begin
	declare cust_country varchar(222);
	select country into cust_country from customers where customerNumber=id;
	case 
		when cust_country='USA' then
		set time = '2 days';
		when cust_country='CANADA' then
		set time = '4 days';
		else set time = '7 days';
	end case;
	end //
	delimiter ;
	delimiter //
-------------------------------------------------------------------------------------------------------------------
FUNCTION USING CASE:

create function delivery_time1(id int) returns varchar(199) 
begin
declare cust_country varchar(222);
declare time  varchar(199);
select country into cust_country from customers where customerNumber=id;
case cust_country
	when 'USA' then
	set time = '2 days';
	when 'CANADA' then
	set time = '4 days';
	else set time = '7 days';
end case;
return (time);
end //
delimiter ;
-------------------------------------------------------------------------------------------------------------------
FETCH ALL USER ALONG WITH EMAIL USING CURSOR:

delimiter //
create procedure cursor_demo(inout email_list varchar(10000))
begin
declare name varchar(190);
declare emailid varchar(200);
declare finished_flag int default 0;
declare c1 cursor for select username, email from users;
declare continue handler for NOT FOUND set finished_flag = 1;
open c1;
custom_loop: loop 
fetch c1 into name, emailid;
if finished_flag = 1 then
	leave custom_loop;
end if;
set email_list = concat(name,': ', emailid,email_list);
end loop custom_loop;
close c1;
end//
delimiter ;
------------------------------------------------------------------------------------------------------------------
SORT USIGN CASE:

select title, price from product 
order by CASE 
when price < 500
then price end,
case 
when price > 500 
then price end desc
-----------------------------------------------------------------------------------------------------------------------

