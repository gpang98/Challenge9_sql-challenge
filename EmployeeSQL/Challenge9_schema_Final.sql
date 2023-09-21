-- Codes to create the Schema for the employee_db
-- titles Table
CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR
);


-- departments Table
CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR
);


-- employees Table
CREATE TABLE employees(
  emp_no INTEGER PRIMARY KEY,
  emp_title VARCHAR NOT NULL,
  FOREIGN KEY (emp_title) REFERENCES titles(title_id),
  birth_date DATE,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR,
  hire_date DATE
);


-- dept_manager Table
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- dept_emp Table
CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- salaries Table
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary INT
);