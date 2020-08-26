 
	GET USERNAME, ORDER_ID AND QUANTITY FOR THAT ORDER_ID
  select username, quantity, order_id from orders inner join users on orders.user_id = users.id;
  
----------------------------------------------------------------------------------------------------------------------------
	GET ALL USER S ORDER_ID AND QUANTITY FOR THAT ORDER_ID
  select username, quantity, order_id from orders right join users on orders.user_id = users.id group by username;
  
----------------------------------------------------------------------------------------------------------------------------
	GET TOTAL ORDER GROUP BY AUTHOR
  select author, sum(orders.quantity) as `total ordered quantity`, product.quantity as `available quantity` from product left join orders on orders.product_id = product.id group by author;
  
----------------------------------------------------------------------------------------------------------------------------
  GET ALL USERNAME, TOTAL QUANTITY AND ALL AUTHOR 
  select u.username, sum(o.quantity), p.author from orders o right join users u on o.user_id = u.id right join product p on o.product_id = p.id group by p.author, u.username;
  
 ----------------------------------------------------------------------------------------------------------------------------
 Write a query in SQL to find the names of departments where more than two employees are working
select d.dpt_name from emp_department d inner join emp_details e on d.dpt_code = e.emp_dept group by d.dpt_name having count(*) >2;

----------------------------------------------------------------------------------------------------------------------------
 Write a query in SQL to display all the data of employees including their department.  
 select * from emp_department e inner join emp_details d on e.DPT_CODE = d.EMP_DEPT;
 
 ----------------------------------------------------------------------------------------------------------------------------
 Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000.
  select t2.emp_fname as firstname, t2.emp_lname as lastname from emp_department t1 inner join emp_details t2 on t1.DPT_CODE = t2.EMP_DEPT where t1.DPT_ALLOTMENT > 50000;
  
  ----------------------------------------------------------------------------------------------------------------------------
  
  Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order.
select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name, s.commission from orders o inner join customer c on o.customer_id = c.customer_id inner join salesman s on s.salesman_id = c.salesman_id;



