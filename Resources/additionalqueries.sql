---Find count of total current employees
select count(emp_no),title
from emptab
where to_date='9999-01-01'
group by title
order by  count(emp_no) desc;

--- Create table to store current employees with distinct titles
select distinct on (e.emp_no) e.emp_no,e.first_name,e.last_name,t.title,e.birth_date,t.to_date
into emptab
from employees e 
inner join titles t
on e.emp_no=t.emp_no
and to_date ='9999-01-01'
order by e.emp_no;

--- Count all employees by title birth_date between '1956-01-01'  and '1965-12-31' 
select count(emp_no),title
from emptab
where to_date='9999-01-01'
and birth_date between '1956-01-01'  and '1965-12-31'
group by title
order by  count(emp_no) desc;