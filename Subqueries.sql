--https://www.w3resource.com/sql-exercises/sql-subqueries-exercises.php?passed=passed#SQLEDITOR

/*Write a query to display the name ( first name and last name ) for those employees who gets more salary than the employee whose ID is 163. */
select first_name, last_name from employees where salary > (select salary from employees where employee_id = 163);
------------------------------------------------------------------------------------------------------------------
/*Write a query to display the name ( first name and last name ), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 169.*/
select concat(first_name,' ',last_name), salary,  job_id from employees where job_id= (select job_id from employees where employee_id =  169 );
------------------------------------------------------------------------------------------------------------------
 /*Write a query to display the name ( first name and last name ), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.*/
select first_name, last_name, salary, department_id from employees where salary IN (select min(salary) from employees group by department_id) ;

------------------------------------------------------------------------------------------------------------------
 /*Write a query in SQL to display the details of the current job for those employees who worked as a Sales Representative in the past.*/
select * from jobs where job_id = (
    select job_id from employees where employee_id = (
        select employee_id from job_history where job_id = 'SA_REP'
    )
);
------------------------------------------------------------------------------------------------------------------
/*Write a query in SQL to display all the infromation about those employees who earn second lowest salary of all the employees
select min(salary) from employees where salary > (select min(salary) from employees */
SELECT * FROM employees m WHERE  2 = (SELECT COUNT(DISTINCT salary ) FROM employees WHERE  salary <= m.salary);
------------------------------------------------------------------------------------------------------------------
/*Write a query in SQL to display all the information of those employees who did not have any job in the past.*/
select * from employees where employee_id not in (select employee_id from job_history);
------------------------------------------------------------------------------------------------------------------
/*Write a query in SQL to display the full name (first and last name) of manager who is supervising 4 or more employees.*/
select * from employees where employee_id in (select manager_id from employees group by manager_id having count(*) > 4);
------------------------------------------------------------------------------------------------------------------
/*Write a query in SQL to display the detail information of those departments which starting salary is at least 8000*/
select * from departments where department_id in (select department_id from employees group by department_id having min(salary)>8000 );

select (select concat(username," ",phone_no) as user_detail from users where id = user_id), quantity from orders;
--------------------------------------------------------------------------------------------------------
--GEt username and pno, product author, quantity using subquery
select (select concat(username," ",phone_no) as user_detail from users where id = user_id), (select author from product where id = product_id), quantity from orders;
