	
create table blinfo(id int auto_increment,DateTimeCol DATETIME ,CpuCount int,Cpu_Working_Time int,Cpu_idle_Time int,cpu_percent int,Usage_Cpu_Count  int, number_of_software_interrupts_since_boot int,number_of_system_calls_since_boot int, number_of_interrupts_since_boot int,cpu_avgload_over_1_min int,cpu_avg_load_over_5_min int,cpu_avg_load_over_15_min int,system_total_memory int,system_used_memory int,system_free_memory int,system_active_memory int,system_inactive_memory int,system_buffers_memory int,system_cached_memory int,system_shared_memory int,system_avalible_memory int,disk_total_memory int,disk_used_memory int,disk_free_memory int,disk_read_count int,disk_write_count int,disk_read_bytes int,disk_write_bytes int,time_spent_reading_from_disk int,time_spent_writing_to_disk int,time_spent_doing_actual_IOs int,number_of_bytes_sent int,number_of_bytes_received int,number_of_packets_sent int,number_of_packets_recived int,total_number_of_errors_while_receiving int,total_number_of_errors_while_sending int,total_number_of_incoming_packets_which_were_dropped int,total_number_of_outgoing_packets_which_were_dropped int ,boot_time int,user_name varchar(255),keyboard int,mouse int,technology varchar(255),files_changed varchar(255), unique key id(id, datetimecol)
)
partition by range columns (DateTimeCol)(
PARTITION p0 values less than ('2019-09-19'),
PARTITION p1 values less than ('2019-09-20'),
PARTITION p2 values less than ('2019-09-21'));


load data local infile 'C:/Users/Sagar/Downloads/CpuLogData2019-09-18.csv' into table blinfo
 fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (DateTimeCol,CpuCount,Cpu_Working_Time,Cpu_idle_Time,cpu_percent,Usage_Cpu_Count,number_of_software_interrupts_since_boot,number_of_system_calls_since_boot,number_of_interrupts_since_boot,cpu_avgload_over_1_min,cpu_avg_load_over_5_min,cpu_avg_load_over_15_min,system_total_memory,system_used_memory,system_free_memory,system_active_memory,system_inactive_memory,system_buffers_memory,system_cached_memory,system_shared_memory,system_avalible_memory,disk_total_memory,disk_used_memory,disk_free_memory,disk_read_count,disk_write_count,disk_read_bytes,disk_write_bytes,time_spent_reading_from_disk,time_spent_writing_to_disk,time_spent_doing_actual_IOs,number_of_bytes_sent,number_of_bytes_received,number_of_packets_sent,number_of_packets_recived,total_number_of_errors_while_receiving,total_number_of_errors_while_sending,total_number_of_incoming_packets_which_were_dropped,total_number_of_outgoing_packets_which_were_dropped,boot_time,user_name,keyboard,mouse,technology,files_changed) ;


load data local infile 'C:/Users/Sagar/Downloads/CpuLogData2019-09-19.csv' into table blinfo fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows
(DateTimeCol,CpuCount,Cpu_Working_Time,Cpu_idle_Time,cpu_percent,Usage_Cpu_Count,number_of_software_interrupts_since_boot,number_of_system_calls_since_boot,number_of_interrupts_since_boot,cpu_avgload_over_1_min,cpu_avg_load_over_5_min,cpu_avg_load_over_15_min,system_total_memory,system_used_memory,system_free_memory,system_active_memory,system_inactive_memory,system_buffers_memory,system_cached_memory,system_shared_memory,system_avalible_memory,disk_total_memory,disk_used_memory,disk_free_memory,disk_read_count,disk_write_count,disk_read_bytes,disk_write_bytes,time_spent_reading_from_disk,time_spent_writing_to_disk,time_spent_doing_actual_IOs,number_of_bytes_sent,number_of_bytes_received,number_of_packets_sent,number_of_packets_recived,total_number_of_errors_while_receiving,total_number_of_errors_while_sending,total_number_of_incoming_packets_which_were_dropped,total_number_of_outgoing_packets_which_were_dropped,boot_time,user_name,keyboard,mouse,technology,files_changed);


load data local infile 'C:/Users/Sagar/Downloads/CpuLogData2019-09-20.csv' into table blinfo fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows
(DateTimeCol,CpuCount,Cpu_Working_Time,Cpu_idle_Time,cpu_percent,Usage_Cpu_Count,number_of_software_interrupts_since_boot,number_of_system_calls_since_boot,number_of_interrupts_since_boot,cpu_avgload_over_1_min,cpu_avg_load_over_5_min,cpu_avg_load_over_15_min,system_total_memory,system_used_memory,system_free_memory,system_active_memory,system_inactive_memory,system_buffers_memory,system_cached_memory,system_shared_memory,system_avalible_memory,disk_total_memory,disk_used_memory,disk_free_memory,disk_read_count,disk_write_count,disk_read_bytes,disk_write_bytes,time_spent_reading_from_disk,time_spent_writing_to_disk,time_spent_doing_actual_IOs,number_of_bytes_sent,number_of_bytes_received,number_of_packets_sent,number_of_packets_recived,total_number_of_errors_while_receiving,total_number_of_errors_while_sending,total_number_of_incoming_packets_which_were_dropped,total_number_of_outgoing_packets_which_were_dropped,boot_time,user_name,keyboard,mouse,technology,files_changed);

select partition_name, table_rows from information_schema.partitions where table_name = 'blinfo';




select user_name, count(present) from (select distinct user_name, day(datetimecol) as present from blinfo) d group by user_name;

--absent 
select user_name, count(present) from (select distinct user_name, day(datetimecol) as present from blinfo) d group by user_name having count(present)<3;

--no of stud in each technology
select count(user_name), technology from blinfo group by technology; 

--no of times keyboard or mouse count 0 for each user
select user_name, count(*) from blinfo where mouse=0 or keyboard=0 group by user_name;

select user_name, count(present) from (select distinct user_name, day(datetimecol) as present from blinfo) d group by user_name order by count(present) limit 5;


 select user_name, count(present) from (select distinct user_name, day(datetimecol) as present from blinfo) d group by user_name order by count(present)  limit 1 offset 3; 