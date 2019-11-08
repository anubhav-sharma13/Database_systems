USE COMPANY;
select Fname from EMPLOYEE where Salary > ( select AVG(Salary) from EMPLOYEE );
select Fname from EMPLOYEE where Ssn in ( select Ssn from EMPLOYEE where Ssn in (  select  Super_ssn from EMPLOYEE ) ) and Ssn not in (select  Essn from DEPENDENT ) ;
select e.ssn, (e.salary/m.s) AS throughput from EMPLOYEE AS e, (select essn, sum(hours) AS s from WORKS_ON group by WORKS_ON.essn) AS m where e.ssn = m.essn order by throughput DESC;
select  d.dnumber, avg(tpt.throughput) as avg_tpt from (select e.ssn, e.dno, (e.salary/m.s) AS throughput from EMPLOYEE AS e, (select essn, sum(hours) AS s from WORKS_ON group by WORKS_ON.essn) AS m where e.ssn = m.essn order by throughput) as tpt, DEPARTMENT as d group by d.dnumber;
select Pname, COUNT( Essn) from WORKS_ON JOIN PROJECT ON PROJECT.Pnumber = WORKS_ON.Pno GROUP BY Pno ;
select e.ssn, e.salary, e.dno from EMPLOYEE as e, (select dno,count(ssn) from EMPLOYEE group by dno) as newd where ((e.dno = newd.dno) and e.salary > 37000);
select e.fname, e.minit, e.lname from EMPLOYEE as e,( select distinct essn from WORKS_ON where (pno!=1 and pno!=2)) as newssn where e.ssn = newssn.essn;


USE COLLEGE;
select avg(CGPA) from STUDENT where CGPA in (select CGPA from STUDENT where RollNumber in ( select  RollNo from TAKES where CNO = ( select CNO from COURSE where CName = 'information technology' ) )) ;
select Name from FACULTY where FID not in ( select Head from RESEARCH_CENTER);
select CName from COURSE where CNO not in ( select CNO from TAKES where GRADE = 'A' ) ;