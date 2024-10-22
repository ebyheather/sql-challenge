-- Employee number, last name, first name, sex, and salary of each employee
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM 
	employees
JOIN 
	salaries ON employees.emp_no = salaries.emp_no;

-- First name, last name, and hire date for employees hired in 1986
SELECT 
	first_name,
	last_name,
	hire_date
FROM 
	employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Manager of each department along with department number, department name, employee number, last name, and first name
SELECT 
    departments.dept_no, 
    departments.dept_name, 
    employees.emp_no, 
    employees.last_name, 
    employees.first_name
FROM 
    dept_manager
JOIN 
    departments ON dept_manager.dept_no = departments.dept_no
JOIN 
    employees ON dept_manager.emp_no = employees.emp_no;	

-- Department number for each employee along with employee's employee number, last name, first name, and department name
SELECT
	dept_emp.dept_no,
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM 
	dept_emp
JOIN
	employees ON employees.emp_no = dept_emp.emp_no
JOIN
	departments ON departments.dept_no = dept_emp.dept_no;

-- First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	first_name,
	last_name,
	sex
FROM
	employees
WHERE 
	first_name = 'Hercules' AND last_name LIKE 'B%';

-- Each employee in the Sales department, including employee number, last name, and first name
SELECT 
	employees.emp_no,
	employees.first_name,
	employees.last_name
FROM 
	employees
JOIN 
	dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN
	departments ON departments.dept_no = dept_emp.dept_no
WHERE 
	departments.dept_name = 'Sales';

-- Each employee in the Sales and Development departments including employee number, last name, first name, and department name
SELECT
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM
	employees
JOIN 
	dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN
	departments ON departments.dept_no = dept_emp.dept_no
WHERE
	departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- Frequency counts in descending order of all employee last names
SELECT
	last_name,
	COUNT(last_name) AS Frequency
FROM 
	employees
GROUP BY 
	last_name
ORDER BY
	Frequency DESC;