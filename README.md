# Challenge9_sql-challenge

The codes used are taken from lecture notes and ChatGPT.

The following was done to accomplish the required tasks:
1. Data Modelling
   - After visual inspection and using Python to check the CSV files, dept_emp.csv file emp_no column has 31579 duplicates
     while employees.csv file emp_no column has no duplicates.  Hence, employees.csv file is the key file with its emp_no column
     being the Primary Key.
   - There are 300,024 unique emp_no columns in employees.csv file
   - https://www.quickdatabasediagrams.com/ was used to create the diagram as given in the attached image.
   - 6 tables were created.  
   - The main table is employees which has direct linkage to dept_emp, salary, titles and dept_manager tables
   - employees has an indirect relationshp to departments either via dept_manager or dept_emp tables.


2. Data Engineering
   - The ERD above is used as the basis for the creation of the tables in PostgreSQL.
   - The order of table creation is important as some table rely on other tables to use the column as Foreign Key
   - The sequence of table creation is as follow:
     1.  titles
     2. departments
     3. employees
     4. dept_manager
     5. dept_emp
     6. salaries
   - The same order in used to import the CSV File into each table while making sure to check the Header option is ON.


3. Data Analysis
   - The 8 questions were then answered using SQL query as given in attachment.
   - 
   Q1. List the employee number, last name, first name, sex, and salary of each employee.
       -> Total of 300,024 employees are listed

   Q2. List the first name, last name, and hire date for the employees who were hired in 1986.
       -> Total of 36,150 employees were hired in 1986.

   Q3. List the manager of each department along with their department number, department name, 
       employee number, last name, and first name.
       -> 24 managers are listed working for the various departments

   Q4. List the department number for each employee along with that employee’s employee number, 
       last name, first name, and department name.
       -> Total of 331,603 employees are listed.  Some employees work for more than one department.
          This suggest that the dataset reflect where employees have worked in the past and currently working.

   Q5. List the first name, last name, and sex of each employee whose first name is Hercules and 
       whose last name begins with the letter B.
       -> 20 employeees has Hercules as first_name and last_name starting with B

   Q6. List each employee in the Sales department, including their employee number, last name, and first name.
       -> 52,245 employees worked for Sales Department

   Q7. List each employee in the Sales and Development departments, including their employee number, 
       last name, first name, and department name.
       -> There are 137,952 total employees working in Sales and Development Department.

   Q8. List the frequency counts, in descending order, of all the employee last names 
       (that is, how many employees share each last name).
      -> There are 1638 total of different last_name with Baba being the most popular (226 times).
