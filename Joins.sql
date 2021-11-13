USE FirstDb
--Self Join
CREATE TABLE ProductCategories(
	Id int identity primary key,
	ParentCategory nvarchar(250) NOT NULL,
	Category int,
)
SELECT p1.ParentCategory,p2.ParentCategory 'Category' FROM ProductCategories p1
JOIN
ProductCategories p2
ON
p1.Category=p2.Id


--Cross Join
CREATE TABLE Vehicles(
Id int identity primary key,
Name nvarchar(150) NOT NULL
)
CREATE TABLE Colors(
Id int identity primary key,
Color nvarchar(20) NOT NULL
)
SELECT Name,Color FROM Vehicles
CROSS JOIN
Colors


--Non equi join
CREATE TABLE Price(
	Id int identity primary key,
	Class char,
	MinPrice int check(MinPrice>=5000 AND MinPrice<=100000),
	MaxPrice int check(MaxPrice>=10000 AND MaxPrice<=800000)
)
CREATE TABLE Cars(
Id int identity primary key,
Brand nvarchar (150) NOT NULL,
Cost int check (Cost>=5000 AND Cost<=800000)
)
SELECT Brand,Cost,Class 'Class' FROM Cars cr
JOIN Price pr
ON
cr.Cost BETWEEN pr.MinPrice and pr.MaxPrice
