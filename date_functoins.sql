select curdate();

select curtime();

select current_timestamp();

select date_add(current_timestamp, interval 30 minute);

select date_add(current_timestamp, interval 1 hour);

select date_add(current_timestamp, interval 1 day);

select date_sub(current_timestamp, interval 1 day);

select date_sub(current_timestamp, interval 1 hour);

select date_sub(current_timestamp, interval 30 minute);

select date_sub(current_timestamp, interval 1 week);

select date_sub(current_timestamp, interval 1 month);

select curdate + 0; // date in format YYYYMMDD

select date_format(curdate(), '%W %M %Y'); --week, month, year

select DATEDIFF(curdate(), date_sub(curdate(), interval 5 day));

select timediff(curtime(), date_sub(curtime(), interval 30 minute));