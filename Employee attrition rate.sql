SELECT * FROM employee_attration.employee_attrition;

-- Write the query to find the datils of employee under attrition having 5+ years of experience in b/w age group of 25 to 35--
SELECT * FROM employee_attrition
 where AGE BETWEEN 25 AND 35 
 AND Attrition="Yes"
 Having TotalWorkingYears>=5;
 
 -- find the details of employess having maximum and minimum salary working in different department who received less than 13% salary--
 
 SELECT DEPARTMENT,
       MAX(MONTHLYINCOME),
       MIN(MONTHLYINCOME)
 FROM EMPLOYEE_ATTRITION
 WHERE PercentSalaryHike<13
 GROUP BY DEPARTMENT
 ORDER BY MAX(MONTHLYINCOME) DESC;
 
 -- calculate the average monthly income of all employee who worked more than 5 year whose eduaction background is medical--
 
 SELECT AVG(MONTHLYINCOME)
 FROM employee_attrition
 WHERE YearsAtCompany>5
 AND EducationField="MEDICAL"
 GROUP BY EducationField;
 
 -- Identify the total no.of male and female employee under attration whose marital status in single and haven't received promotion in the last 2 years--
 
 SELECT GENDER,COUNT(EMPLOYEENUMBER)
 FROM employee_attrition
 WHERE MaritalStatus="Single"
 AND YearsSinceLastPromotion=2
 GROUP BY GENDER;
 
 -- EMPLOYEE WITH MAX PERFORMANCE RATING BUT NO PRMOTION FOR 4+ YEAR AND ABOVE--
 
 SELECT COUNT(*) FROM employee_attrition
 WHERE PerformanceRating=(SELECT MAX(PerformanceRating) from employee_attrition)
 and YearsSinceLastPromotion>=4;
 
 -- WHICH ARE DEPARTMENT IN COMPANY--
 
 SELECT DISTINCT DEPARTMENT FROM employee_attrition;
 
 -- EMPLOYEE WORKING OVERTIME BUT GIVEN MIN SALARY HKE AND MORE THAN 7 YEAR WITH COMPANY.--
 
 SELECT * FROM employee_attrition
 WHERE OVERTIME="YES"
 AND PercentSalaryHike=(SELECT MIN(PercentSalaryHike) FROM EMPLOYEE_ATTRITION)
 AND YearsAtCompany>7;
 
 -- EMPLOYEE NOT WORKING OVERTIME BUT GIVEN MAX SALARYHIKE AND MORE THAN 5 YEAR WITH COMPANY--
 
  SELECT * FROM employee_attrition
 WHERE OVERTIME="NO"
 AND PercentSalaryHike=(SELECT MAX(PercentSalaryHike) FROM EMPLOYEE_ATTRITION)
 AND YearsAtCompany>5;
 
 -- CALCULATE AVE MONTHLY INCOME OF ALL EMPLOYEE WHO TRAVEL FREQUENTLY WHOSE EDUCAITON BACKGROUND IS TECHICAL DEGREE.
 
 SELECT AVG(MonthlyIncome)
 FROM employee_attrition
 WHERE BusinessTravel="Travel_Frequently"
 AND EducationField="Technical Degree"
 GROUP BY EducationField;

-- WHICH DEPARTMENT HAVE MAX ATTARATION RATE--

SELECT DEPARTMENT,COUNT(*)
FROM employee_attrition
WHERE Attrition="YES"
GROUP BY DEPARTMENT;

-- COUTN NO.OF EMPLYOEE WHO ARE WORKING IN SALES AND EDUCATION FIELD IS LIFE SCIENCE--

SELECT Department,EducationField,count(*)
FROM employee_attrition
WHERE Department="Sales"
AND EducationField="Life Sciences";

-- CALCULATE THE AVG STATISFACTION RATE FOR EMPLYOEES WHO ARE WORKING IN SALES--

SELECT Department,AVG(EnvironmentSatisfaction) AS COUNT
FROM  employee_attrition
where Department="Sales";

-- FIND THE TYPES OF JOB ROLE IN COMPANY--

SELECT COUNT(distinct(JOBROLE)) 
FROM employee_attrition;

-- CALCULATE THE AVERAGE JOB INVOVLEMENT FOR EACH ROLE--

SELECT JobRole,AVG(JobInvolvement) AS COUNT
From employee_attrition
GROUP BY JOBROLE
ORDER BY COUNT DESC;

-- CALCULATE THE AVERAGE JOB STATISFACTION FOR EACH ROLE--

SELECT JobRole,AVG(JobSatisfaction) AS COUNT
From employee_attrition
GROUP BY JOBROLE
ORDER BY JobSatisfaction DESC, COUNT DESC;

-- CALCULATE  AVG MONTHLY INCOME FOR EACH JOB ROLE--

SELECT JobRole,AVG(MonthlyIncome) AS INCOME
From employee_attrition
GROUP BY JobRole
ORDER BY INCOME DESC;

-- FIND THE NO.OF RESEARCH SCIENTIST WHO WORKED OVERTIME--

SELECT JobRole,OverTime,count(jobrole) as count
from employee_attrition
where JobRole="Research Scientist"
and OverTime="YES"
GROUP BY JobRole;

-- FIND MAX AND MIN SALARY HIKE IN LABORATORY TECHNICIAN--

SELECT JobRole,
	   PercentSalaryHike,
       max(PercentSalaryHike),
       min(PercentSalaryHike)
from employee_attrition
WHERE JobRole="Laboratory Technician"
Group by JobRole;       

-- CALCULATE THE AVERAGE PERFORMANCE RATING FOR EACH JOB ROLE--

SELECT JOBROLE,AVG(PerformanceRating) AS COUNT
FROM employee_attrition
GROUP BY JobRole
ORDER BY COUNT DESC;

-- CALCULATE THE AVG WORK LIFE BALANCE FOR EACH JOB ROLE--

SELECT JOBROLE,AVG(WorkLifeBalance) AS COUNT
FROM employee_attrition
GROUP BY JobRole
ORDER BY COUNT DESC;

-- FIND THE AVG JOB STATIFACTION OF THOSE WHO HAVE NOT BEEN PROMOTED IN THE LAST 5 YEARS---

SELECT GENDER,YearsSinceLastPromotion,AVG(JobSatisfaction) AS COUNT
FROM employee_attrition
where YearsSinceLastPromotion>5
group by Gender;

-- CALCULATE THE NO.OF PERSON WHO ARE IN CURRENT ROLE MORE THAN 5 YEARS & GET SALARY HIKE>10 IN ALL DEPARTMENT--

SELECT Department,YearsInCurrentRole,
PercentSalaryHike,COUNT(EmployeeNumber)
FROM employee_attrition
WHERE YearsInCurrentRole>=10
AND PercentSalaryHike>10
group by Department


 
 


 
 

 
 
 
 
 





