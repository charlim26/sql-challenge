--1.Create a department table
DROP TABLE departments;

CREATE TABLE departments (
  	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

--1.Create a dept emp table
DROP TABLE dept_emp;

CREATE TABLE dept_emp (
    emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

