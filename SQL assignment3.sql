create table student
(
id int primary  key identity,
name varchar(20),
branchid int,
gender varchar(20),
branch varchar(20))
insert into student values
('nisha',2,'female','ece'),
('neon',1,'female','cse'),
('roshan',3,'male','eee'),
('asha',2,'female','it'),
('deenur',3,'male','ece')
select *from student
drop table student

--Branchid--
create function branchid(@bid int)
returns table
as 
return(select * from student where branchid=@bid)
select * from dbo.branchid(2)

--Gender--
create function gender(@gender varchar(10))
returns table
as 
return(select * from student where gender=@gender)
select * from dbo.gender('female')
drop function gender
--NetCount--
--Trigger--
create table tblemployee(id int,name varchar(40),gender varchar(40),salary int,deptid int )
insert into tblemployee values
(1,'raj','male',9000,1),
(2,'rani','female',91000,3),
(3,'markas','male',14000,2),
(4,'riyakshini','female',24000,1),
(5,'pavan','male',10000,3)
select * from tblemployee
drop table tblemployee
create table tblemployeeaudit(id int identity(1,1) primary key,auditdata nvarchar(1000) )
create trigger tr_tblemployee_fordelete
on tblemployee
for delete

as
begin 
declare @id int
select @id=id from deleted
delete from tblemployee  where id=4
insert into tblemployeeaudit values ('new employee'+cast(@id as varchar (10))+'is inserted'+cast(getdate() as varchar(30)))
end
select *from tblemployee
select *from tblemployeeaudit
insert into tblemployee values (4,'rikshitha','female',6677865,5)
delete from tblemployee  where id=3
drop trigger tr_tblemployee_fordelete

--Subquery--
create table tblproducts
(
id int primary key identity,
name varchar(20),
decsrption varchar(100)
) 
create table productssales
(
id int primary key identity,
productid int foreign key references tblproducts(id),
unitprice int,
quantitysoled int
)
insert into tblproducts values
('iphone','it is one of the best'),
('realme','new feature'),
('huwai','older model')
insert into prodcutssales values
(5,350,1),
(4,250,2),
(3,350,3),
(2,350,4)
select * from tblproducts where id in
(
select Distinct productid 
from prodcutssales 
where quantitysoled =0
)