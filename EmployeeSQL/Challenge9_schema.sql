-- Codes to create the Schema for the employee_db
-- titles Table
CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR NOT NULL
);


-- departments Table
CREATE TABLE departments (
  depart_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR NOT NULL
);


-- employees Table
CREATE TABLE employees(
  emp_no INTEGER PRIMARY KEY,
  emp_title VARCHAR NOT NULL,
  FOREIGN KEY (emp_title) REFERENCES titles(title_id),
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date DATE NOT NULL
);


-- dept_manager Table
CREATE TABLE dept_manager (
  depart_no VARCHAR NOT NULL,
  FOREIGN KEY (depart_no) REFERENCES departments(depart_no),
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- dept_emp Table
CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  depart_no VARCHAR NOT NULL,
  FOREIGN KEY (depart_no) REFERENCES departments(depart_no)
);

-- salaries Table
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary INT NOT NULL
);

