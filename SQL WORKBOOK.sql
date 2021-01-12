USE employees;

-- Display first and last names of employees
SELECT 
    first_name, last_name
FROM
    employees;

#Display all records in employee table
SELECT 
    *
FROM
    employees;

/*
Select the information from the “dept_no” column of the “departments” table.
*/

SELECT 
    dept_no
FROM
    departments;

/*
Select all data from the “departments” table.
*/

SELECT 
    *
FROM
    departments;

/*
Select all people from the “employees” table whose first name is “Elvis”.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';

/*
Retrieve a list with all female employees whose first name is Kellie.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

/*
Retrieve a list with all employees whose first name is either Kellie or Aruna.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

/*
Retrieve a list with all female employees whose first name is either Kellie or Aruna.
*/

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');

/*
Use the IN operator to select all individuals from the “employees” table, 
whose first name is either “Denis”, or “Elvis”.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Elvis' , 'Denis');

/*
Extract all records from the ‘employees’ table, 
aside from those with employees named John, Mark, or Jacob.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

/*
Working with the “employees” table, 
use the LIKE operator to select the data about all individuals, 
whose first name starts with “Mark”; specify that the name 
can be succeeded by any sequence of characters.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

/*
Retrieve a list with all employees who have been hired in the year 2000.
*/

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');

/*
Retrieve a list with all employees whose employee number is 
written with 5 characters, and starts with “1000”. 
*/

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

/*
Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

/*
Once you have done that, extract another list containing 
the names of employees that do not contain “Jack”.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');

/*
Select all the information from the “salaries” table regarding 
contracts from 66,000 to 70,000 dollars per year.
*/


SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

/*
Retrieve a list with all individuals whose employee number 
is not between ‘10004’ and ‘10012’.
*/

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    
/*
Select the names of all departments with numbers between ‘d003’ and ‘d006’.
*/
#Check dept_no datatype..................................
SELECT 
    DATA_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'departments'
        AND COLUMN_NAME = 'dept_no';
#........................................................

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

/*
Select the names of all departments whose department number value is not null.
*/

SELECT 
   dept_name #*
FROM
    departments
WHERE
    dept_no IS NOT NULL;

/*
Retrieve a list with data about all female employees who were hired in the year 2000 or after.
*/

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND hire_date LIKE ('20%');

#Different Method
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
        
/*
Extract a list with all employees’ salaries higher than $150,000 per annum.
*/

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
/*
Obtain a list with all different “hire dates” from the “employees” table.

Expand this list and click on “Limit to 1000 rows”. 
This way you will set the limit of output rows displayed back to the default of 1000.
*/

SELECT DISTINCT
    hire_date
FROM
    employees;

/*
How many annual contracts with a value higher than or equal to $100,000 
have been registered in the salaries table?
*/

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
/*
How many managers do we have in the “employees” database? 
Use the star symbol (*) in your code to solve this exercise.
*/

SELECT 
    COUNT(*)
FROM
    dept_manager;

#Method 2
SELECT 
    COUNT(DISTINCT emp_no)
FROM
    dept_manager;

/*
Select all data from the “employees” table, ordering it by “hire date” in descending order.
*/

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

/*
 Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
 The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
 Lastly, sort the output by the first column
*/

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

/*
Select all employees whose average salary is higher than $120,000 per annum.
*/

SELECT 
    emp_no, AVG(salary) AS avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

/*
Select the employee numbers of all individuals who have signed more than 1 contract 
after the 1st of January 2000
*/

SELECT 
    emp_no, COUNT(from_date) AS num_of_contract
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

/*
Select the first 100 rows from the ‘dept_emp’ table. 
*/

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

/*
Select ten records from the “titles” table to get a better idea about its content.
Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record
*/

SELECT 
    *
FROM
    titles
LIMIT 10;

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

INSERT INTO titles 
(
	emp_no,
    title, 
    from_date
)
VALUES 
(
	999903,
    "Senior Engineer",
    '1997-10-01'
);

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

/*
Insert information about the individual with employee number 999903 into the “dept_emp” table. 
He/She is working for department number 5, and has started work on  October 1st, 1997; 
her/his contract is for an indefinite period of time.
*/

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO dept_emp 
(
	emp_no,
    dept_no,
    from_date,
    to_date
)
VALUES 
(
	999903,
    'd005',
    "1997-10-01",
    "9999-01-01"
);

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

#CREATE NEW TABLE

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT 
    *
FROM
    departments_dup;

INSERT INTO departments_dup (
    dept_no,
    dept_name 
) SELECT * FROM departments;

SELECT 
    *
FROM
    departments_dup;
#.....................................................................................

/*
Create a new department called “Business Analysis”. Register it under number ‘d010’.
*/

INSERT INTO departments 
(
    dept_no,
    dept_name 
) 
VALUES
( 
	"d010",
    "Business Analysis"
);
    
SELECT 
    *
FROM
    departments;

/*
Change the “Business Analysis” department name to “Data Analysis”.
*/

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';
	#dept_no = 'd010';

/*
Remove the department number 10 record from the “departments” table.
*/

DELETE FROM departments 
WHERE
    dept_no = 'd010';

#AGGREGATE FUNCTIONS
/*
How many departments are there in the “employees” database?
*/

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

/*
What is the total amount of money spent on salaries for all contracts 
starting after the 1st of January 1997?
*/

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
	from_date > "1997-01-01";

/*
1. Which is the lowest employee number in the database?
2. Which is the highest employee number in the database?
*/

SELECT 
    MIN(emp_no)
FROM
    employees;
    
SELECT 
    MAX(emp_no)
FROM
    employees;

/*
What is the average annual salary paid to employees 
who started after the 1st of January 1997?
*/

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

#ROUND
/*
Round the average amount of money spent on salaries for all contracts 
that started after the 1st of January 1997 to a precision of cents.
*/

SELECT 
    ROUND(AVG(salary), 2) AS 'Avg_Salary>1997'
FROM
    salaries
WHERE
    from_date > '1997-01-01';

#COALESCE & IFNULL PREAMBLE
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT
*
FROM
departments_dup
ORDER BY dept_no ASC;

COMMIT;

#IFNULL & COALESCE
/*
Select the department number and name from the ‘departments_dup’ table and 
add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.
*/

SELECT 
    dept_no, dept_name, IFNULL(dept_no, dept_name) AS dept_info
FROM
    departments_dup;

#Method 2
SELECT 
    dept_no,
    dept_name,
	COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

/*
Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, 
so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
*/

SELECT

    IFNULL(dept_no, 'N/A') as dept_no,

    IFNULL(dept_name, 'Department name not provided') AS dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup

ORDER BY dept_no ASC;

/*
If you currently have the ‘departments_dup’ table set up, 
use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.

Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

(If you don’t currently have the ‘departments_dup’ table set up, create it. 
Let it contain two columns: dept_no and dept_name. 
Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40. 
Both columns are allowed to have null values. Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)

Then, insert a record whose department name is “Public Relations”.

Delete the record(s) related to department number two.

Insert two new records in the “departments_dup” table. 
Let their values in the “dept_no” column be “d010” and “d011”.
*/
ALTER TABLE departments_dup
DROP COLUMN dept_manager;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name CHAR(40) NULL;


INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

INSERT INTO departments_dup (dept_no)
VALUES ('d010'), ('d011');

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
 
#INPUTING INFO FROM ONE TABLE INTO ANOTHER 
INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;
/*............................................
INSERT INTO dept_manager_dup 
(
	emp_no, 
    from_date
)
VALUES 
(
	999904, 
    '2017-01-01'
),
(
	999905, 
    '2017-01-01'
),

(
	999906, 
	'2017-01-01'
),
(
	999907, 
    '2017-01-01'
);

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES ('Public Relations');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002'; 
........................................................................... */   
    
#JOINS
/*
Extract a list containing information about all managers’ employee number, 
first and last name, department number, and hire date. 
*/

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    dept_manager dm
        INNER JOIN
    employees e ON dm.emp_no = e.emp_no;

/*
Join the 'employees' and the 'dept_manager' tables 
to return a subset of all the employees whose last name is Markovitch. 
See if the output contains a manager with that name.  
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

/*
Extract a list containing information about all managers’ employee number, 
first and last name, department number, and hire date. 
Use the old type of join syntax to obtain the result.
*/

#OLD JOIN
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    dept_manager dm,
    employees e
WHERE
    dm.emp_no = e.emp_no;

#NEW JOIN
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no;
    
    set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

/*
Select the first and last name, the hire date, 
and the job title of all employees whose first name is “Margareta” and 
have the last name “Markovitch”.
*/

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.hire_date, 
    t.title
FROM
    employees e
        LEFT JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch';
        
/*
Use a CROSS JOIN to return a list with all possible combinations 
between managers from the dept_manager table and department number 9.
*/

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009';

/*
Return a list with the first 10 employees 
with all the departments they can be assigned to.
*/

SELECT 
    *
FROM
    employees;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    emp_no <= 10010; #emp < 10011;
    
#JOIN MORE THAN TWO TABLES
/*
Select all managers’ first and last name, hire date, 
job title, start date, and department name.
*/

SELECT * FROM titles;
SELECT * FROM dept_manager;
    
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    dept_manager dm
        LEFT JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.first_name;

/*
How many male and how many female managers do we have in the ‘employees’ database?
*/

#METHOD 1
SELECT 
    t.title AS Title, e.gender AS Gender, COUNT(DISTINCT e.emp_no) AS Manager_Count
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
GROUP BY e.gender;

/*
UNION VS UNION ALL
*/

SELECT 
    *
FROM
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
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;

#SQL Subqueries with IN nested inside WHERE
/*
Extract the information about all department managers who were hired 
between the 1st of January 1990 and the 1st of January 1995.
*/

#METHOD 1
SELECT 
    e.*
FROM
    employees e
WHERE
    (e.hire_date BETWEEN '1990-01-01' AND '1995-01-01')
        AND e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
#Method 2
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

#SQL Subqueries with EXISTS-NOT EXISTS nested inside WHERE
/*
Select the entire information for all employees whose job title is “Assistant Engineer”. 
*/

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            (t.emp_no = e.emp_no)
                AND (t.title = 'Assistant Engineer'));

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/
    
    
