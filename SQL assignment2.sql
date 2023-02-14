---welcome to sql server---

create database nisha
use nisha
CREATE PROCEDURE tablee
as
begin
print 'welcome to sql server'
end
exec tablee
create  table tbldepartment(id int primary key identity,departmentname varchar(50),location varchar(100),departmenthead varchar(50))
insert into tbldepartment values
('jk','newzealand','rick'),
('cash','italy','hgi'),
('developer','paris','muse')

create table tblemployee(id int primary key identity,name varchar(50),gender varchar(50),salary int,departmentid int foreign key references tbldepartment(id))
insert into tblemployee values
('rani','female',5300,1),
('raju','male',1400,2),
('rosh','male',5000,4),
('anu','female',4400,2)
select * from tblemployee

-----Question 2--
create proc tablee2(@gender varchar(50),@departmentid int)
as
begin
select name,gender,salary from tblemployee 
where @gender=gender and @departmentid=departmentid
end
exec tablee2 'male',4
drop proc tablee2

---Question 3---

create proc company(@gender varchar(10),@departmentid int,@totalcount int output )
as 
begin
select name,gender,salary from tblemployee
where @gender=gender and @departmentid=departmentid
select @totalcount=@@rowcount
end
declare @count int;
exec company @gender='male',@departmentid=4,@totalcount=@count output
select @count as'number of employees'
select * from tblemployee

----Question 4---

create proc company2(@gender varchar(50))
as 
begin
select count(gender) from tblemployee
where @gender=gender
end
 
 exec company2 'male'
 drop proc add_numbers

 ---Question 5---
 create proc add_numbers(@num1 int=0,@num2 int=0 ,@num3 int=0)
 as
 begin
 declare @result int
 set @result=@num1+@num2+@num3
 select @result as [sum]
 end

 exec add_numbers 10,11