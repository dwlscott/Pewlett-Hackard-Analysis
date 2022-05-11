--Departments 
-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

-- Creating table for Employees 
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);


CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--- Drop the talbe and re add it
DROP TABLE dept_emp CASCADE;
--add it back in 
CREATE TABLE dept_emp ( 
   emp_no INT NOT NULL, 
   dept_no VARCHAR NOT NULL, 
   from_date DATE NOT NULL, 
   to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
--Create a talbe for title s

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR NOT NULL, 
    from_date DATE NOT NULL 
    to_date DATE NOT NULL 
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

--- Creat a talbe for dept_emp 
CREATE TABLE dept_emp ( 
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL, 
    from_date DATE NOT NULL, 
    to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


--Check to see if the shit works 
SELECT * FROM departments;
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM employees; 
SELECT * FROM salaries; 
SELECT * FROM titles; 


-- Employee count by department number 
CREATE TABLE Count_by_Dept (
	count INT NOT NULL, 
	dept_no VARCHAR NOT NULL	
);
 
 
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce 
LEFT JOIN dept_emp as de 
ON ce.emp_no = de.emp_no 
GROUP BY de.dept_no
ORDER BY de.dept_no
-- The skill drill is working my nerves ill come back to it. 
INTO count_by_dept;


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Add a column to the Retiring employees 
DROP TABLE retirement_info;
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;


-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;


--Use Alias codes for readablilty 
SELECT ri.emp_no, 
	ri.first_name, 
ri.last_name, 
	de.to_date 
FROM retirement_info as ri
LEFT JOIN dept_dept as de
ON ri.emp_no = de.emp_no;

--Joining departments and dept_manager tables 
SELECT d.dept_name, 
	dm.emp_no, 
	dm.from_date,
	dm.to_date 
FROM departments as d 
Inner JOIN dept_manager as dm 
ON d.dept_no = dm.dept_no;

--Use left join for retirment_info and dept_emp tables 
SELECT ri.emp_no, 
	ri.first_name,
	ri.last_name,
de.to_date 
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de 
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');


-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

--We have to drop the table first 
DROP TABLE Retirement_info;
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no; 

SELECT dept_name from departments

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON Retirement_info.emp_no = dept_emp.emp_no;

SELECT emp_no from retirement_info;

--Take fucking I forgot 
-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Drop the table and then make a new on with correct pramaters 
DROP TABLE retirement_info;
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;
--Check the table 
SELECT dept_name from departments

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = cast (dept_emp.emp_no as integer);
--Check the table 
SELECT emp_no from retirement_info;

--Trouble shooting 
SELECT * FROM departments;
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM employees; 
SELECT * FROM retirement_info; 
SELECT * FROM salaries; 
SELECT * FROM titles; 

ALTER TABLE dept_emp ALTER COLUMN emp_no type int; 


--To include all of the information Bobby's manager wants, we'll need to create an entirely new table from the beginning. Here's everything we need:

--Employee number
--First name
--Last name
--Gender
--to_date
--Salary

SELECT * FROM salaries
ORDER BY to_date DESC;

--- List one emp_data

-- THe INTO infomration is not working 
DROP TABLE IF EXISTS emp_info;
DROP SEQUENCE IF EXISTS emp_info;

SELECT emp_no,
	first_name, 
	last_name, 
	gender
--INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
--INTO emp_info
FROM employees as e 
INNER JOIN salaries as s 
ON (e.emp_no =s.emp_no)
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (de.to_date = '9999-01-01');
	 
SELECT * FROM  emp_info;

-- LIst 2 Management
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name, 
	dm.from_date, 
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON(dm.dept_no = d.dept_no)
	INNER JOIN current_emp AS ce 
		ON(dm.emp_no = ce.emp_no);
	
####

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;


ELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
--INTO emp_info
FROM employees as e 
INNER JOIN salaries as s 
ON (e.emp_no =s.emp_no)
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (de.to_date = '9999-01-01');

		