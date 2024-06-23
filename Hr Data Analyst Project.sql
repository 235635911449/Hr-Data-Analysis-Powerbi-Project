create Database HRdatabase;
use hrdatabase;
select * 
from hrdata;
-- Total Employee
select sum(employee_count)
from hrdata;

-- Attrition Count
select count(attrition)
from hrdata
where attrition = 'Yes';

-- Rate of Attrition
select
      round(((select count(attrition) from hrdata where attrition = 'yes')/ sum(employee_count))*100,1)
from hrdata;

-- No Of Active Employee
select sum(employee_count)-(select count(attrition) from hrdata where attrition = 'Yes')
from hrdata;

-- Average Age 
select round(avg(age))
from hrdata;

-- Count Of attrion By Gender
select gender,count(attrition) as attrition_count
from hrdata
where attrition ='yes'
group by gender;

-- Department Wise Attrition

select department, count(attrition),
round ( ( (count(attrition) ) / (select count(attrition) from hrdata where attrition= 'Yes')) * 100,2) as pct from hrdata
where attrition='Yes'
group by department
order by count(attrition) desc;

-- No of Employees by Age Group
select age_band,gender,sum(employee_count)
from hrdata
group by age_band,gender
order by age_band,gender asc;

-- Job Satisfaction Rating

select job_role,
      sum(case when job_satisfaction = 1 then employee_count else 0 end ) as one,
	  sum(case when job_satisfaction = 2 then employee_count else 0 end ) as Two ,   
	  sum(case when job_satisfaction = 3 then employee_count else 0 end ) as Three,     
	  sum(case when job_satisfaction = 4 then employee_count else 0 end ) as Four,
      count(employee_count) as total
from hrdata
group by job_role
order by job_role;      

-- Education Feildwise Attrition

select education_field,count(attrition)
from hrdata
where attrition = 'yes'
group by education_field
order by attrition;

-- attrition By gender for different age group

select age_band,gender,count(attrition),
round((count(attrition)/(select (count(attrition)) from hrdata where attrition = 'yes'))*100,2) as pct
from hrdata
where attrition ='yes'
group by age_band, gender
order by age_band  ;