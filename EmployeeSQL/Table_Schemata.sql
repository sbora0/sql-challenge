-- Drop tables
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- Create titles table
CREATE TABLE titles(
		title_id VARCHAR(5) PRIMARY KEY,
		title VARCHAR(20) NOT NULL
);

-- Create employees table
CREATE TABLE employees(
		emp_no INT PRIMARY KEY,
		emp_title_id VARCHAR(5) REFERENCES titles (title_id),
		birth_date DATE NOT NULL,
		first_name VARCHAR(30) NOT NULL,
		last_name VARCHAR(30) NOT NULL,
		sex VARCHAR(1) NOT NULL,
		hire_date DATE NOT NULL
);

-- Create departments table
CREATE TABLE departments(
		dept_no VARCHAR(5) PRIMARY KEY,
		dept_name VARCHAR(25) NOT NULL
);

-- Create department employees table
CREATE TABLE dept_emp(
		emp_no INT REFERENCES employees (emp_no),
		dept_no VARCHAR(5) REFERENCES departments (dept_no),
		PRIMARY KEY (emp_no, dept_no)
);

-- Create departmenmt managers table
CREATE TABLE dept_manager(
		dept_no VARCHAR(5) REFERENCES departments (dept_no),
		emp_no INT REFERENCES employees (emp_no),
		PRIMARY KEY (dept_no, emp_no)
);

-- Create salaries table
CREATE TABLE salaries(
		emp_no INT PRIMARY KEY REFERENCES employees (emp_no),
		salary INT NOT NULL
);
