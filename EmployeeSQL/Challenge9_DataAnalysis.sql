--- Checking the data loading
SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;


--- Data Analysis
-- Q1.  List the employee number, last name, first name, sex, 
--      and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
s.emp_no=e.emp_no;


-- Q2. List the first name, last name, and --
--     hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


-- Q3. List the manager of each department along with their department number, 
--     department name, employee number, last name, and first name.
SELECT d.depart_no, 
  d.dept_name, 
  e.emp_no,
  e.last_name,
  e.first_name
FROM employees as e
INNER JOIN dept_manager as dm ON
e.emp_no = dm.emp_no
INNER JOIN departments as d ON
dm.depart_no = d.depart_no;


-- Q4. List the department number for each employee along with that 
-      employee’s employee number, last name, first name, and department name.
SELECT d.depart_no, 
  e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
de.depart_no = d.depart_no;


-- Q5. List the first name, last name, and sex of each employee whose first name 
-      is Hercules and whose last name begins with the letter B.
SELECT first_name, 
  last_name,
  sex
FROM employees
WHERE first_name LIKE 'Hercules' AND
last_name LIKE 'B%';


-- Q6. List each employee in the Sales department, including their employee number, 
-      last name, and first name.
SELECT first_name, last_name, sex
FROM employees
WHERE emp_no IN
  (
    SELECT emp_no
    FROM dept_emp
    WHERE depart_no IN
      (
        SELECT depart_no
        FROM departments
        WHERE dept_name = 'Sales'
      )
    )
;


-- Q7. List each employee in the Sales and Development departments, including 
-      their employee number, last name, first name, and department name.
SELECT e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name 
FROM employees as e
INNER JOIN dept_manager as dm ON
e.emp_no = dm.emp_no
INNER JOIN departments as d ON
dm.depart_no = d.depart_no
WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development';


-- Q8. List the frequency counts, in descending order, of all the employee 
-      last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as name_frequency
FROM employees
GROUP BY last_name
ORDER BY name_frequency DESC;



