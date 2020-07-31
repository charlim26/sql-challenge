-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/YRxTrR
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "Emp_No" int   NOT NULL,
    "Emp_Title_ID" varchar(30)   NOT NULL,
    "Birth_Date" Date   NOT NULL,
    "First_Name" varchar(30)   NOT NULL,
    "Last_Name" varchar(30)   NOT NULL,
    "Sex" varchar(30)   NOT NULL,
    "Hire_Date" Date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_No" int   NOT NULL,
    "Dept_No" varchar(30)   NOT NULL
);

CREATE TABLE "Dept" (
    "Dept_No" varchar(30)   NOT NULL,
    "Dept_Name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Dept" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" varchar(30)   NOT NULL,
    "Emp_No" int   NOT NULL
);

CREATE TABLE "Titles" (
    "Title_Id" varchar(30)   NOT NULL,
    "Title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_Id"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" int   NOT NULL,
    "Salary" money   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title_ID" FOREIGN KEY("Emp_Title_ID")
REFERENCES "Titles" ("Title_Id");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Dept_Manager" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Dept" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Dept_Emp" ("Emp_No");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

