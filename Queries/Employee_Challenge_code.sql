--- Deliverable 1
---Retreive employees eligible for retirement
select e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
into retirement_titles
from employees e 
inner join titles t
on e.emp_no=t.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no;

---Retreive the list of employees close to retirement by their recent job title
select distinct on(emp_no) emp_no,first_name,last_name,title
into unique_titles
from retirement_titles
order by emp_no ,to_date desc;

---FInd the count of employees  close to retirement by job title
select count(emp_no) ,title
into retiring_titles
from unique_titles
group by title
order by  count(emp_no) desc;

select * from dept_emp

-----------------Deliverable : 2----------------------------------

----Retreive list of employees eligible for mentonship
select distinct on(emp.emp_no) emp.emp_no,emp.first_name,emp.last_name,t.title,d.from_date,d.to_date
into mentorship_eligibilty
from employees emp 
inner join titles t on emp.emp_no=t.emp_no
inner join dept_emp d
on emp.emp_no=d.emp_no
where emp.birth_date between '1965-01-01' AND '1965-12-31'
AND (d.to_date = '9999-01-01')
order by emp.emp_no;

























