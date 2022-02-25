-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM department_employee;
SELECT * FROM department_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, department_manager.emp_no, employees.first_name, employees.last_name
FROM departments
JOIN department_manager
ON departments.dept_no = department_manager.dept_no
JOIN employees
ON department_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT department_employee.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM department_employee
JOIN employees
ON department_employee.emp_no = employees.emp_no
JOIN departments
ON department_employee.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT department_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employee
JOIN employees
ON department_employee.emp_no = employees.emp_no
JOIN departments
ON department_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT department_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_employee
JOIN employees
ON department_employee.emp_no = employees.emp_no
JOIN departments
ON department_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR Departments.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;



