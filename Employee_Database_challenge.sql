-- Use Dictinct with Orderv by to remove duplicate rows
--SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

--challenge deliveralbe 1 
--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
	
SELECT employees.emp_no,
	  employees.first_name,
	  employees.last_name,
	  titles.title,
	  titles.from_date,
	  titles.to_date 
INTO retirement_titles
From employees
LEFT JOIN titles 
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

SELECT * FROM retirement_titles;
-- Grader said that this one was good. 

--Note: There are duplicate entries for some employees because they have switched titles over the years. 
--Use the following instructions to remove these duplicates and keep only the most recent title of each employee.

--Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.
--Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
--Create a Unique Titles table using the INTO clause.
--Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
--Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


--SELECT DISTINCT ON (Location) Location, time, report
--FROM  x_x
--ORDER BY Location, time 
# unique_titles needs to be corrected 

--SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
    --retirement_titles.first_name,
    --retirement_titles.last_name,
   -- retirement_titles.title,
--INTO unique_titles 
--FROM retirement_titles
--ORDER BY retirement_titles.emp_no, retirement_titles.emp_no DESC;

SELECT * FROM unique_titles;

## corrected unique_titles

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
--INTO unique_titles 
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

--Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.
--Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


## This is the correct format but becasue my unique_titles was off this made my counts off. Its been corrected 
SELECT unique_titles.count,
	unique_titles.title 
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY unique_titles.count DESC;

SELECT * FROM retiring_titles


--DELIVERABLE 2

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table.
--Retrieve the title column from the Titles table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Create a new table using the INTO clause.
--Join the Employees and the Department Employee tables on the primary key.
--Join the Employees and the Titles tables on the primary key.
--Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
--Order the table by the employee number.
--Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

## THis one needs to be corrected 
#Where am i suppose to put this though (de.to_date = '9999-01-01')

## THis one needs to be corrected 
SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
    employees.first_name, 
    employees.last_name, 
    employees.birth_date,
    dept_emp.from_date,
    dept_emp.to_date,
    titles.title
--INTO mentorship-eligibility
FROM employees 
LEFT JOIN dept_emp 
ON (employees.emp_no = dept_emp.emp_no)
lEFT JOIN titles
ON (titles.emp_no = employees.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY employees.emp_no;

# I thnk we are good it ran and worked. 