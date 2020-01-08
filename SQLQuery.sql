use P213;

create table Groups(
	Id int primary key identity,
	Name nvarchar(100) not null
)

create table Students(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(100),
	GroupId int references Groups(Id)
)

Select * from Students
Select * from Groups

Select * from Students s
join Groups g
on s.GroupId=g.Id

select * from Students s
left join Groups g
on s.GroupId=g.Id
--where g.Id is Null

select s.Name,s.Surname,g.Name 'Group' from Students s
right join Groups g
on s.GroupId=g.Id

select * from Students s
full join Groups g
on g.Id=s.GroupId

create Table Staff(
	Id int primary key identity,
	Position nvarchar(100),
	ReportTo int
)
select * from Staff

Select s1.Position,s2.Position 'ReportTo' from Staff s1
left join Staff s2
on s1.ReportTo=s2.Id

alter table Students
add Grade int

create table Grades(
	Id int primary key identity,
	Letter char not null,
	MaxGrade int not null,
	MinGrade int not null
)

select * from Students
select * from Grades

Select s.Name,s.Surname,s.Grade,g.Letter from Students s
join Grades g
on s.Grade between g.MinGrade and g.MaxGrade

create table Sizes(
	Id int primary key identity,
	Size nvarchar not null
)

create table Produts(
	Id int primary key identity,
	Model nvarchar(50)
)

alter table Sizes
add Size nvarchar(50) not null

select top 10 * from Produts
cross join Sizes
order by Produts.Id desc,Sizes.Size desc

use P213;

create table Employees(
	id int primary key identity,
	Name nvarchar(100),
	Position nvarchar(100),
	Salary int
)

select Avg(Salary) 'Avg Salary' from Employees

select * from Employees
where Salary<(
	select AVG(Salary) from Employees
)

select SUM(Salary) 'Total',Count(*) 'Employees Number' from Employees
where Salary>(
	Select AVG(Salary) from Employees
)