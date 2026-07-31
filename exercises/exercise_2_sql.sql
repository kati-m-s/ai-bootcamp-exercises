-- Exercise 2: SQL
-- ======================
-- This exercise has three levels. Complete as far as you can.
--
-- To test your queries, run:
--   python exercises/run_sql.py
--
-- This will execute each query against an in-memory SQLite database
-- loaded with the sample data from data/schema.sql.


-- ============================================================
-- BASE LEVEL — Simple queries
-- ============================================================

-- Query 1: List all employees sorted by name alphabetically.
-- Expected columns: name, salary, hire_date

SELECT name, salary, hire_date 
  FROM employees
  ORDER BY name

-- Nothing to comment.
  
-- Query 2: List all employees with their department name.
-- (Hint: you need to JOIN two tables)
-- Expected columns: employee_name, department_name

-- Nothing to comment.

  SELECT e.name as employee_name, d.name as department_name
  FROM employees e
  LEFT OUTER JOIN departments d ON e.department_id = d.id
  
-- Query 3: Count how many employees are in each department.
-- Expected columns: department_name, employee_count

-- I'll lazily use the previous query and count employees by department.
  
SELECT department_name, count(1) as employee_count
  FROM
  (SELECT e.name as employee_name, d.name as department_name
  FROM employees e
  LEFT OUTER JOIN departments d ON e.department_id = d.id)
  GROUP BY department_name

-- ============================================================
-- STANDARD LEVEL — JOINs, aggregations, filtering
-- ============================================================

-- Query 4: Find the top 3 departments by average salary.
-- Expected columns: department_name, avg_salary

-- Join employees and departments, calculate averages by departments, order descending and take top 3.
  
SELECT d.name as department_name, AVG(e.salary) as avg_salary
FROM employees e LEFT OUTER JOIN departments d ON e.department_id = d.id
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 3

-- Query 5: Find departments where the total employee salary exceeds the department budget.
-- Expected columns: department_name, total_salary, budget

-- Much the same as previous one, only SUM instead of AVG and then select from result the ones where the budget is smaller than total salary.
-- There is no such department as can easily be seen when running only the inner query.
  
SELECT *
FROM (
SELECT d.name as department_name, SUM(e.salary) as total_salary, d.budget
FROM employees e LEFT OUTER JOIN departments d ON e.department_id = d.id
GROUP BY department_name
)
WHERE budget<total_salary

-- Query 6: Count the number of active projects per department,
--          including departments with zero active projects.
-- Expected columns: department_name, active_project_count

-- In inner SELECT, I create a table which only has departments and active project counts, then in out I join that to departments names, replacing NULL with 0.

SELECT d.name as department_name, COALESCE(pr_count, 0) as active_project_count
FROM departments d LEFT JOIN 
(SELECT department_id as d_id, COUNT(1) as pr_count
FROM projects
WHERE start_date<=DATE('now') AND (end_date>DATE('now') OR end_date IS NULL)
GROUP BY department_id) p
ON p.d_id = d.id


-- ============================================================
-- ADVANCED LEVEL — Subqueries, complex logic
-- ============================================================

-- Query 7: Find employees who were hired in the last 12 months and work in departments
--          with at least one completed project.
-- Expected columns: employee_name, department_name, hire_date

-- Modified slightly the previous query by adding department id, then joined that to employees, selecting out employees with start date in last 1 year and active project count more than 0.

SELECT e.name as employee_name, d.department_name, e.hire_date
FROM employees e LEFT JOIN 
(SELECT d.id as department_id, d.name as department_name, COALESCE(pr_count, 0) as active_project_count
FROM departments d LEFT JOIN 
(SELECT department_id as d_id, COUNT(1) as pr_count
FROM projects
WHERE start_date<=DATE('now') AND (end_date>DATE('now') OR end_date IS NULL)
GROUP BY department_id) p
ON p.d_id = d.id) d
ON e.department_id = d.department_id
WHERE hire_date > date('now','-1 year') AND active_project_count>0

-- Query 8: Rank departments by their "project success rate"
--          (completed projects / total projects). Exclude departments with no projects.
-- Expected columns: department_name, total_projects, completed_projects, success_rate



-- Query 9: For each department, find the employee with the highest salary.
--          If multiple employees tie, show all of them.
-- Expected columns: department_name, employee_name, salary


