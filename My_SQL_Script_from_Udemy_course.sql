USE Sales;

DROP TABLE test;
DROP TABLE sales;

-- CREATE STATEMENT --------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Sales
(
	purchase_number INT NOT NULL AUTO_INCREMENT,
	date_of_purchase DATE NOT NULL,
	customer_id INT,
	item_code VARCHAR(10) NOT NULL,
PRIMARY KEY (purchase_number)
);

CREATE TABLE customers                                                              
(  
    customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),  
    number_of_complaints int,  
primary key (customer_id)  
);  

CREATE TABLE items
(
	item_code VARCHAR (255),  
	item VARCHAR (255),  
	unit_price NUMERIC (10,2),  
	company_id VARCHAR (255),
PRIMARY KEY (item_code)
); 

	CREATE TABLE companies   
(
	company_id varchar(255),   
    company_name varchar(255),  
    headquarters_phone_number int(12),   
primary key (company_id)   
);

-- ALTER STATEMENT ---------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

ALTER TABLE customers
DROP INDEX email_address;

DROP TABLE customers;

CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    
PRIMARY KEY (customer_id)
);

 ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

 
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M');

SELECT * FROM customers;

DROP TABLE companies;

	CREATE TABLE companies   
(
	company_id INT AUTO_INCREMENT,   
    company_name VARCHAR(255) NOT NULL,  
    headquarters_phone_number VARCHAR(255) UNIQUE KEY,   
PRIMARY KEY (company_id)   
);

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

INSERT INTO companies (headquarters_phone_number, company_name)
VALUES (776408099, 'Company A');

SELECT * FROM companies;

ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

CREATE TABLE IF NOT EXISTS test (
    numbers 	INT(10),
    words 		VARCHAR(10)
);


# comment 
/* comment */

-- EMPLOYESS DATABASE ------------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT STATEMENT ---------------------------------------------------------------------------------------------------------------------------------------------------

use employees;

SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE first_name = 'Elvis';
    
SELECT 
    dept_no
FROM
    departments;

select * from departments;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';
    
select * from employees
where gender = 'F' and (first_name = 'Kellie' or first_name = 'Aruna');

select * from employees
where first_name in ('Denis', 'Elvis');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
select * from employees
where first_name like ('Mark%');

select * from employees
where hire_date like ('%2000%');

select * from employees
where emp_no like ('1000_');

select * from employees
where first_name like ('%Jack%');

select * from employees
where first_name not like ('%Jack%');

select * from salaries
where salary between 66000 and 70000;

select first_name, last_name from employees
where emp_no not between 10004 and 10012;

select dept_name from departments
where dept_no between 'd003' and 'd006';

select dept_name from departments
where dept_no is not null;

select * from employees
where gender = 'F' and hire_date >= '2000-01-01';

select * from salaries
where salary > 150000;

SELECT DISTINCT
    hire_date
FROM
    employees;
    
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
select * from dept_manager;

select count(*) from dept_manager;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;


SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

select emp_no, count(salary), salary from salaries
group by salary
having salary > 120000
order by salary;

SELECT
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

select * from dept_emp;

SELECT 
    emp_no, COUNT(emp_no) AS number_of_contracts
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

select * from dept_emp
limit 100;

select * from titles
order by emp_no desc
limit 10;

INSERT INTO employees
VALUES
(
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

update employees
set 
first_name = 'John'
where emp_no = 999903;

select * from employees where emp_no = 999903;

insert into titles (emp_no, title, from_date)
values (999903, 'Senior Engineer', '1997-10-01');

select * from dept_emp
order by emp_no desc;

insert into dept_emp
values (999903, 'd005', '1997-10-01', '9999-01-01');

drop table departments_dup;
create table departments_dup
(
dept_no char(4) not null,
dept_name varchar(40) not null
);

insert into departments_dup
(
dept_no, 
dept_name 
)
select * from departments;

insert into departments_dup
values ('d010', 'Business Analysis');

commit;

update departments_dup
set dept_name = 'Quality control'
where dept_no = 'd010';

delete from departments_dup
where dept_no = 'd011';
delete from departments_dup
where dept_no = 'd010';

select * from departments_dup;

rollback;
commit;

select * from departments;

update departments
set
dept_name = 'Data Analysis'
where dept_no = 'd010';

commit;

select * from titles
where emp_no = 999903;

delete from employees
where emp_no = 999903;

rollback;

SELECT * FROM departments_dup;

DELETE FROM departments_dup;

rollback;

delete from departments
where dept_no = 'd010';

select * from departments;

-- AGREGATE FUNCTIONS ----------------------------------------------------------------------------------------------------------------------------------------------

select count(distinct dept_no) from dept_emp;

select sum(salary) from salaries
where from_date > '1997-01-01';

select max(emp_no) from employees;

select round(avg(salary),2) from salaries
where from_date > '1997-01-01';

select * from departments_dup;

alter table departments_dup
add column dept_info varchar(255) null;

select 
	dept_no, 
    dept_name,
    coalesce (dept_no, dept_name) as dept_info
from departments_dup;

select 
IFNULL(dept_no, 'N/A') as dept_no,
IFNULL(dept_name, 'Department name not provided') as dept_name
from departments_dup;

insert into departments_dup (dept_no) values ('d011');
insert into departments_dup (dept_name) values ('Accounting');

alter table departments_dup
change column dept_no dept_no varchar(10) null;

alter table departments_dup
change column dept_name dept_name varchar(255) null;

delete from departments_dup
where dept_name = 'Sales';

select 
IFNULL(dept_no, 'N/A') as dept_no,
IFNULL(dept_name, 'Department name not provided') as dept_name,
    coalesce (dept_no, dept_name) as dept_info
from departments_dup;
 
 -- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
alter table departments_dup
add column dept_manager varchar(255) null after dept_name;

alter table departments_dup
change column dept_name dept_name varchar(40) null;

insert into departments_dup (dept_no) values ('d010'), ('d011');

commit;

alter table departments_dup
drop column dept_manager;

select * from departments_dup;

select coalesce (dept_manager, dept_no, dept_name) as dept_manager from departments_dup;

insert into departments_dup values ('d012', 'Public Relations', null);

delete from departments_dup
where dept_no = 'd012';

insert into departments_dup (dept_name) value ('Public Relations');

alter table departments_dup
change column dept_no dept_no char(4) NULL,
change column dept_name dept_name varchar(40) NULL;

delete from departments_dup
where dept_no = 'd002';

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
 

INSERT INTO dept_manager_dup
select * from dept_manager;

 select * from dept_manager_dup;

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 
 select * from dept_manager_dup;

DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';
    
select * from dept_manager_dup;

-- SQL JOINS ---------------------------------------------------------------------------------------------------------------------------------------------

select distinct m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join departments_dup d on m.dept_no = d.dept_no;

select m.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from dept_manager m
inner join employees e on m.emp_no = e.emp_no;

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
insert into departments_dup
values ('d009', 'Cusromer Service');

delete from departments_dup
where dept_no = 'd009';

select * from departments_dup;

alter table departments_dup
drop column dept_info;

insert into dept_manager_dup
values ('110228', 'd003', '1992-03-21', '9999-01-01');

delete from dept_manager_dup
where emp_no = '110228';

select * from dept_manager_dup;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        left JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

select e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from employees e
left join dept_manager m on e.emp_no = m.emp_no
where e.last_name = 'Markovitch' and m.dept_no is not null;

select e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from employees e, dept_manager m
where e.emp_no = m.emp_no;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

select e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name = 'Markovitch';

select dm. *, d. *
from dept_manager dm
cross join departments d
order by dm.emp_no, d.dept_no;

select e.*, d.*
from departments d
cross join dept_manager dm
join employees e on dm.emp_no = e.emp_no
where d.dept_no <> dm.dept_no
order by dm.emp_no, d.dept_no;

SELECT m.*, d.*
FROM dept_manager m
CROSS JOIN departments d
WHERE d.dept_no = 'd009';
    
select * from departments;
select * from employees;

select e.*, d.*
from employees e
cross join departments d
where e.emp_no <= 10010
order by e.emp_no, d.dept_no;

select e.gender, AVG (s.salary) as average_salary
from employees e 
join salaries s on e.emp_no = s.emp_no
group by gender;

select e.first_name, e.last_name, e.hire_date, t.title, t.from_date, d.dept_name
from employees e
join titles t on e.emp_no = t.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where t.title = 'Manager';

select d.dept_name, AVG(salary)
from departments d
join dept_manager m on d.dept_no = m.dept_no
join salaries s on s.emp_no = m.emp_no
group by d.dept_name;

select gender, count(d.emp_no) AS number_of_employees
from employees e
join dept_manager d on d.emp_no = e.emp_no
group by gender;

CREATE TABLE employees_dup (
  emp_no int,
  birth_date date,
  first_name varchar(14),
  last_name varchar(16),
  gender enum('M','F'),
  hire_date date
  );
  
  insert into employees_dup
  select * from employees e
  limit 20;
  
  select * from employees_dup;
  
  insert into employees_dup
  values ('10001',	'1953-09-02',	'Georgi',	'Facello',	'M',	'1986-06-26');
  
SELECT * FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NUlL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;

-- SQL SUBQUERIES -------------------------------------------------------------------------------------------------------------------------------------

select e.first_name, e.last_name
from employees e
where e.emp_no in (select dm.emp_no from dept_manager dm);

select e.first_name, e.last_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no;

select e.first_name, e.last_name
from employees e
where exists (select * from dept_manager dm where dm.emp_no = e.emp_no);

SELECT * FROM dept_manager
WHERE emp_no IN (SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');

-- comment
select * from employees e
where exists (select * from titles t where e.emp_no = t.emp_no and t.title = 'Assistant Engineer');

select e.first_name, e.last_name, t.title
from employees e 
join titles t on t.emp_no = e.emp_no
where t.title = 'Assistant Engineer';

select A.* from
	(select 
		e.emp_no as employee_ID,
		min(de.dept_no) as department_code,
		(select emp_no from dept_manager where emp_no = 110022) as manager_ID
	from employees e 
	join dept_emp de on e.emp_no = de.emp_no
	where e.emp_no <= 10020
	group by e.emp_no
	order by e.emp_no) as A
    
union

select B.* from
	(select 
		e.emp_no as employee_ID,
		min(de.dept_no) as department_code,
		(select emp_no from dept_manager where emp_no = 110039) as manager_ID
	from employees e 
	join dept_emp de on e.emp_no = de.emp_no
	where e.emp_no between 10021 and 10040
	group by e.emp_no
	order by e.emp_no) as B;
    
drop table if exists emp_manager;
    
create table emp_manager
    (emp_no int(11) not null,
    dept_no char(4) null,
    manager_no int(11) not null);
    
    
    
Insert INTO emp_manager
SELECT U.*
FROM (
	(select A.* from
		(select 
			e.emp_no as employee_ID,
			min(de.dept_no) as department_code,
			(select emp_no from dept_manager where emp_no = 110022) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no <= 10020
		group by e.emp_no
		order by e.emp_no) as A)
UNION 
	select B.* from
		(select 
			e.emp_no as employee_ID,
			min(de.dept_no) as department_code,
			(select emp_no from dept_manager where emp_no = 110039) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no between 10021 and 10040
		group by e.emp_no
		order by e.emp_no) as B
 UNION 
 (select C.* from
		(select 
			e.emp_no as employee_ID,
			min(de.dept_no) as department_code,
			(select emp_no from dept_manager where emp_no = 110039) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no = 110022
		group by e.emp_no
		order by e.emp_no) as C)
 UNION 
	(select D.* from
			(select 
				e.emp_no as employee_ID,
				min(de.dept_no) as department_code,
				(select emp_no from dept_manager where emp_no = 110022) as manager_ID
			from employees e 
			join dept_emp de on e.emp_no = de.emp_no
			where e.emp_no = 110039
			group by e.emp_no
			order by e.emp_no) as D)
) AS U;

select * from emp_manager;

-- SELF JOIN ---------------------------------------------------------------------------------------------------------------------------------

select distinct e1.* from emp_manager e1
/*self*/ join emp_manager e2 on e1.emp_no = e2.manager_no;

select * from dept_emp;

select emp_no, from_date, to_date, count(emp_no) as Num 
 from dept_emp
group by emp_no
having count(emp_no)>1;

-- VIEWS -------------------------------------------------------------------------------------------------------------------------------------

create or replace view v_dept_emp_latest_date as
	select emp_no, max(from_date) as from_date, max(to_date) as to_date
	from dept_emp
	group by emp_no;

select * from v_dept_emp_latest_date;

create or replace view avg_manager_salary as
	select round(avg(s.salary),2)
    from salaries s
    join dept_manager d on s.emp_no = d.emp_no;

select * from avg_manager_salary;


create view avg_manager_salary as
	select avg(salary) from salaries s
    where emp_no in
		(select emp_no from dept_manager);
        
select * from avg_manager_salary;

select avg(salary) from salaries s
join dept_manager dm on s.emp_no = dm.emp_no;

select * from current_dept_emp;

-- PROCEDURES----------------------------------------------------------------------------------------------------------------------------

DELIMITER //
create procedure first_1000()
begin
	select * from employees
    limit 1000;
end//
DELIMITER ;

call employees.first_1000();

DELIMITER //
CREATE PROCEDURE avg_salary()
BEGIN
	SELECT AVG(salary)
    FROM salaries;
END//
DELIMITER ;

call avg_salary;

drop procedure select_salaries;

rollback;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT  e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

call emp_salary(11300);

DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT  e.first_name, e.last_name, round(avg(s.salary), 2) as AVG_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

call emp_avg_salary(11300);

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out (in p_emp_no INT, out p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT AVG(s.salary)
    INTO p_avg_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END$$
DELIMITER ;

drop procedure emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info (in p_first_name varchar(255), in p_last_name varchar(255), out output INT)
	BEGIN
		SELECT e.emp_no
        INTO output
        FROM employees e
        WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
	END$$
DELIMITER ;

select * from employees;

set @v_emp_no = 0;
call emp_info ('Aruna', 'Journel', @v_emp_no);
select @v_emp_no;

select * from employees;

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary;
  
  -- USER-DEFINED FUNCTIONS-----------------------------------------------------------------------------------------------------------------------------
  
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INT) RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	DECLARE v_avg_salary DECIMAL (10,2);
		SELECT AVG(s.salary)
        INTO v_avg_salary
        FROM employees e
        JOIN salaries s ON e.emp_no = s.emp_no
        WHERE e.emp_no = p_emp_no;
    RETURN v_avg_salary;
END$$
DELIMITER ;

SELECT f_emp_avg_salary(11300);

drop function emp_info2;

DELIMITER $$
CREATE FUNCTION emp_info2 (p_first_name varchar(255), p_last_name varchar(255)) RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	DECLARE v_max_from_date DATE;
	DECLARE v_salary DECIMAL (10,2);
		SELECT MAX(s.from_date)
        INTO v_max_from_date
        FROM salaries s
        JOIN employees e on e.emp_no = s.emp_no
        WHERE p_first_name = e.first_name and p_last_name = e.last_name;
        
        SELECT s.salary
        INTO v_salary
        FROM salaries s 
		JOIN employees e on e.emp_no = s.emp_no
        WHERE p_first_name = e.first_name and p_last_name = e.last_name and s.from_date = v_max_from_date;
        
    RETURN v_salary;
END$$
DELIMITER ;


drop function emp_info;

DELIMITER $$
CREATE FUNCTION emp_info (p_first_name varchar(255), p_last_name varchar(255)) RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	DECLARE v_salary DECIMAL (10,2);
    DECLARE v_max_from_date DATE;
        
        SELECT MAX(from_date)
        INTO v_max_from_date
        FROM employees e
        JOIN salaries s ON e.emp_no = s.emp_no
        WHERE e.first_name = p_first_name and e.last_name = p_last_name;
        
		SELECT s.salary
        INTO v_salary
        FROM employees e
        JOIN salaries s ON e.emp_no = s.emp_no
        WHERE e.first_name = p_first_name and e.last_name = p_last_name and s.from_date = v_max_from_date;
        
    RETURN v_salary;
END$$
DELIMITER ;

select emp_info('Aruna', 'Journel');

select * from salaries s
join employees e on e.emp_no = s.emp_no;

SET @v_emp_no = 11300;
SELECT
	emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM employees
WHERE emp_no = @v_emp_no;

-- VARIABLES ----------------------------------------------------------------------------------------------------------------------

set @s_var1 = 3;
select @s_var1;

SET GLOBAL max_connections = 1000;

SET @@global.max_connections = 3;

rollback;

-- TRIGGERS ---------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
	END IF; 
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$
DELIMITER ;

DROP TRIGGER trig_upd_salary;

UPDATE salaries
SET salary = 98000
WHERE emp_no = '10001' AND from_date = '2010-06-22';

SELECT * FROM salaries WHERE emp_no = '10001' AND from_date = '2010-06-22';


# For instance, SYSDATE() delivers the date and time of the moment at which you have invoked this function.
SELECT SYSDATE();

# Another frequently employed function, “Date Format”, assigns a specific format to a given date. For instance, the following query 
# could extract the current date, quoting the year, the month, and the day. 
SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;

DELIMITER $$
CREATE TRIGGER t_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > SYSDATE() THEN
    SET NEW.hire_date = DATE_FORMAT(SYSDATE(), '%y-%m-%d');
    END IF;
END$$
DELIMITER ;

select * from employees;

insert into employees values (500000, '1999-09-29', 'Daria', 'Chornaya', 'F', '2022-11-05');

select * from employees where hire_date > '2000-01-01';

select * from dept_manager;
INSERT INTO dept_manager VALUES (74444, 'd002', sysdate(), '9999-01-01');

delete from dept_manager
where emp_no = 96924;

drop trigger promotion_to_manager;

DELIMITER $$
CREATE TRIGGER promotion_to_manager
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE curr_salary int;
		SELECT MAX(salary) 
        INTO curr_salary
        FROM salaries
        WHERE emp_no = NEW.emp_no;
	
    IF curr_salary IS NOT NULL THEN
		UPDATE salaries s
        SET to_date = sysdate()
        WHERE emp_no = NEW.emp_no AND to_date = NEW.to_date;
        
		INSERT INTO salaries VALUES 
					(NEW.emp_no,
                    curr_salary+20000,
                    NEW.from_date,
                    NEW.to_date);
	END IF;	
END$$
DELIMITER ;


select * from salaries
where emp_no = 74444;

-- INDEXEX (TO SPEAD UP RESEARCH, LIKE IN LIBRARY) ------------------------------------------------------------------------------------
create index i_hire_date on employees(hire_date);

alter table employees
drop index i_hire_date;

select * from employees where first_name = 'Daria' and last_name = 'Chornaya';

create index first_and_last_name on employees(first_name, last_name);

select * from salaries
where salary > 89000;

alter table salaries
drop index i_salary;

create index i_salary on salaries(salary);

COMMIT;

-- CASE STATEMENT + IF()-----------------------------------------------------------------------------------------------------------------------------

SELECT 
	emp_no,
    first_name,
    last_name,
    CASE
		WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
        END AS gender
	FROM employees;
    
SELECT 
	emp_no,
    first_name,
    last_name,
    CASE gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
        END AS gender
	FROM employees;
    
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS is_manager
FROM employees e
LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no
WHERE e.emp_no > 109990;

SELECT 
	emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') as gender
FROM employees;

SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS is_manager
FROM employees e
LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

select * from dept_manager;

SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary)-MIN(s.salary) AS difference,
    CASE
			WHEN MAX(s.salary)-MIN(s.salary) > 30000 THEN 'higher then $30.000'
            ELSE 'lower then $30.000'
    END AS salary_raise
FROM dept_manager dm
LEFT JOIN employees e ON dm.emp_no = e.emp_no
LEFT JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no;

SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary)-MIN(s.salary) AS difference,
    IF (MAX(s.salary)-MIN(s.salary)>30000, 'higher', 'lower') AS salary_raise
FROM dept_manager dm
LEFT JOIN employees e ON dm.emp_no = e.emp_no
LEFT JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no;

select * from employees;
select * from dept_emp;

SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    d.from_date,
    d.to_date,
    CASE
		WHEN max(d.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM employees e
JOIN dept_emp d on e.emp_no = d.emp_no
GROUP BY d.emp_no
LIMIT 100;

SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    d.from_date,
    d.to_date,
    IF(max(d.to_date) > SYSDATE(), 'Is still employed', 'Not an employee anymore') AS current_employee
FROM employees e
JOIN dept_emp d on e.emp_no = d.emp_no
GROUP BY e.emp_no
LIMIT 100;

-- WINDOW FUNCTIONS----------------------------------------------------------------------------------------------------------------------
-- RANKING WINDOW FUNCTIONS------------------------------------------

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries;

SELECT
	emp_no,
    dept_no,
    from_date,
    to_date,
    ROW_NUMBER() OVER(ORDER BY emp_no) AS row_num
FROM dept_manager;

SELECT 
	emp_no,
    first_name,
    last_name,
    ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY last_name) AS row_num
FROM employees;

SELECT 
	dm.emp_no,
    s.salary,
    ROW_NUMBER() OVER() AS row_1,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY s.salary) AS row_2
FROM salaries s
JOIN dept_manager dm on s.emp_no = dm.emp_no
ORDER BY row_1;

SELECT 
	dm.emp_no,
    s.salary,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY s.salary) AS row_1,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY s.salary DESC) AS row_2
FROM salaries s
JOIN dept_manager dm on s.emp_no = dm.emp_no;

SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT 
	emp_no,
    first_name,
    last_name,
    ROW_NUMBER() OVER W1 AS row_1
FROM employees
WINDOW W1 AS (PARTITION BY first_name ORDER BY emp_no);

SELECT a.emp_no, MAX(salary) AS max_salary 
FROM
	(SELECT
		emp_no,
        salary,
        ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
	FROM salaries) AS a
GROUP BY emp_no;

select emp_no, max(salary)
from salaries
group by emp_no;

SELECT a.emp_no, MIN(salary) AS min_salary
FROM
	(SELECT
		emp_no,
        salary,
        ROW_NUMBER() OVER w AS row1
	FROM salaries
    WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) AS a
GROUP BY emp_no;
    
select emp_no, min(salary)
from salaries
group by emp_no;

SELECT a.emp_no, MIN(salary) AS min_salary
FROM
	(SELECT
		emp_no,
        salary,
        ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row1
	FROM salaries) AS a
GROUP BY emp_no;

SELECT A.emp_no, min(salary)
FROM 
	(SELECT
		emp_no,
        salary
	FROM salaries) AS A
GROUP BY emp_no;

-- second-lowest
SELECT a.emp_no, a.salary AS second_lowest
FROM
	(SELECT
		emp_no,
        salary,
        ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary) AS row_num
	FROM salaries) AS a
WHERE a.row_num = 2;

select * from salaries
where emp_no < 10010
order by emp_no, salary;

-- RANK functions assign same value to the identical rows
-- focus on the number of rows, ex: rank 3, 3, 5

SELECT emp_no, (COUNT(salary) - COUNT(DISTINCT salary)) as diff
FROM salaries
GROUP BY emp_no
HAVING diff > 0
ORDER BY emp_no;

SELECT
	emp_no,
    salary,
    RANK() OVER w AS rank_num
FROM salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

-- dense rank focuses on the value itself, ex: 3, 3, 4
SELECT
	emp_no,
    salary,
    DENSE_RANK() OVER w AS rank_num
FROM salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT 
	emp_no,
    salary,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries
WHERE emp_no = 10560;

SELECT
	dm.emp_no,
    COUNT(s.salary)
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no;

SELECT 
	emp_no,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM salaries
WHERE emp_no = 10560;

SELECT 
	emp_no,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM salaries
WHERE emp_no = 10560;

select * from salaries;

SELECT 
	dm.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER(PARTITION BY dm.dept_no ORDER BY s.salary DESC) AS salary_rank,
    s.salary,
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

SELECT
	e.emp_no,
    s.salary,
    RANK() OVER(PARTITION BY e.emp_no ORDER BY s.salary DESC) AS rank_num
FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600;

SELECT
	e.emp_no,
    s.salary,
    DENSE_RANK() OVER(PARTITION BY e.emp_no ORDER BY s.salary DESC) AS rank_num,
    s.from_date,
    e.hire_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) as years_from_start
FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
	AND YEAR(s.from_date) - YEAR(e.hire_date) > 4;
    
-- VALUE WINDOW FUNCTIONS---------------
-- LAG() is previous, LEAD() is next

SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS 'current-previous',
    LEAD(salary) OVER w - salary AS 'next-current'
FROM salaries
WHERE emp_no = 10001
WINDOW w AS (ORDER BY salary);

SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS previus_salary,
    LEAD(salary) OVER w AS subsequent_salary,
    salary - LAG(salary) OVER w AS current_previuos_diff,
    LEAD(salary) OVER w - salary AS subsequent_current_diff
FROM salaries
WHERE emp_no BETWEEN 10500 AND 10600 AND salary > 80000
WINDOW w AS (PARTITION BY emp_no ORDER BY salary);

SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS previus_salary,
    LAG(salary, 2) OVER w AS before_previus_salary,
    LEAD(salary) OVER w AS next_salary,
	LEAD(salary, 2) OVER w AS after_next_salary
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;

SELECT 
	s1.emp_no, 
    s.salary, 
    s.from_date, 
    s.to_date
FROM salaries s
JOIN (SELECT 
		emp_no, 
        MAX(from_date) AS from_date
	FROM salaries
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
 WHERE s.to_date > SYSDATE() AND s.from_date = s1.from_date;   
 
 SELECT
	de.emp_no,
    de.dept_no,
    de.from_date,
    de.to_date
FROM dept_emp de
JOIN (SELECT
		emp_no,
        MAX(from_date) AS from_date
        FROM dept_emp
        GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE de.to_date > SYSDATE() AND de.from_date = de1.from_date;
 
 SELECT
	s.emp_no,
    s.salary,
    s.from_date,
    s.to_date
FROM salaries s
JOIN (SELECT
		emp_no,
        MIN(from_date) AS from_date
		FROM salaries
        GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
WHERE s.from_date = s1.from_date;

SELECT 
	de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_dept
FROM
		(SELECT
			de.emp_no, de.dept_no, de.from_date, de.to_date
		FROM dept_emp de
		JOIN (SELECT
				emp_no, MAX(from_date) AS from_date
				FROM dept_emp
				GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
		WHERE de.to_date > SYSDATE() AND de.from_date = de1.from_date) de2
JOIN
		(SELECT 
			s1.emp_no, s.salary, s.from_date, s.to_date
		FROM salaries s
		JOIN (SELECT 
				emp_no, MAX(from_date) AS from_date
			FROM salaries
			GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
		WHERE s.to_date > SYSDATE() AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
JOIN departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no;

SELECT 
	de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_dept
FROM
		(SELECT
			de.emp_no, de.dept_no, de.from_date, de.to_date
		FROM dept_emp de
		JOIN (SELECT
				emp_no, MAX(from_date) AS from_date
				FROM dept_emp
				GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
		WHERE de.to_date < '2002-01-01' AND de.from_date > '2000-01-01' AND de.from_date = de1.from_date) de2
JOIN
		(SELECT 
			s1.emp_no, s.salary, s.from_date, s.to_date
		FROM salaries s
		JOIN (SELECT 
				emp_no, MAX(from_date) AS from_date
			FROM salaries
			GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
		WHERE s.to_date < '2002-01-01' AND s.from_date > '2000-01-01' AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
JOIN departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no;

COMMIT;    