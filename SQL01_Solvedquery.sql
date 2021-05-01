-- Select all the employees who were born between January 1, 1952 and December 31, 1955 and their titles and title date ranges
-- Order the results by emp_no

select * from (
    select emp_no 
    from employees 
    where birth_date between '1952-01-01' and '1955-12-31'
    ) titles order by emp_no desc

-- Select only the current title for each employee

with ret_employees as (
    select * from (
        select emp_no 
        from employees 
        where birth_date between '1952-01-01' and '1955-12-31'
    ) titles
)
select title 
from ret_employees
where CURDATE() between from_date and to_date

-- Count the total number of employees about to retire by their current job title

with ret_employees as (
    select * from (
        select emp_no 
        from employees 
        where birth_date between '1952-01-01' and '1955-12-31'
    ) titles
)
select count (distinct title) 
from ret_employees
where CURDATE() between from_date and to_date

-- Count the total number of employees per department

with total_empl as (
    select * from (
        select emp_no 
        from employees 
    ) dept_emp
)
select dept_name, count(*) 
from total_emp
group by dept_name

-- Bonus: Find the highest salary per department and department manager

