USE MetroAlt

if exists
 (SELECT name from sys.Databases where Name='PartitionTest')
Begin
Drop Database PartitionTest
End

Create database PartitionTest --create database

go
Alter database PartitionTest
Add FileGroup Schedule2012; --add filegroup
Go
Alter Database PartitionTest
Add file --add file
(
 name ='Schedule2012',
 FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Schedule2012.ndf',
 /*FROM CLASS:  FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC226SQLSERVER\MSSQL\DATA\GrantAugust2013File.ndf',*/
 
 Size=5MB,
 MaxSize=200MB,
 FileGrowth=5mb --will grow by 5MB until you reach 200MB
 )
to filegroup Schedule2012 --add file to filegroup
Go
Alter database PartitionTest
Add FileGroup Schedule2013; --add filegroup
Go
Alter Database PartitionTest
Add file --add file
(
 name ='Schedule2013',
 FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Schedule2013File.ndf',
 /*FROM CLASS:  FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.ITC226SQLSERVER\MSSQL\DATA\Schedule2013File.ndf',*/
 
 Size=5MB,
 MaxSize=200MB,
 FileGrowth=5mb --will grow by 5MB until you reach 200MB
 )
to filegroup Schedule2013 --add file to filegroup

/*
ADD A FILE FOR Schedule2014
*/
Alter database PartitionTest
Add FileGroup Schedule2014; --add filegroup
Go
Alter Database PartitionTest
Add file --add file
(
 name ='Schedule2014',
 FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Schedule2014File.ndf',
 Size=5MB,
 MaxSize=200MB,
 FileGrowth=5mb --will grow by 5MB until you reach 200MB
 )
to filegroup Schedule2014 --add file to filegroup

/*
ADD A FILE FOR Schedule2015
*/
Alter database PartitionTest
Add FileGroup Schedule2015; --add filegroup
Go
Alter Database PartitionTest
Add file --add file
(
 name ='Schedule2015',
 FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Schedule2015File.ndf',
 Size=5MB,
 MaxSize=200MB,
 FileGrowth=5mb --will grow by 5MB until you reach 200MB
 )
to filegroup Schedule2015 --add file to filegroup


/*
ADD AN ADDITIONAL FILEGROUP AND FILE 
BECAUSE YOU NEED ONE MORE FILE THAN THE NUMBER OF PARTITIONS
*/
Alter database PartitionTest
Add FileGroup ScheduleOverfow; --add filegroup
Go
Alter Database PartitionTest
Add file --add file
(
 name ='ScheduleOverfow',
 FileName='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ScheduleOverfowFile.ndf',
 Size=5MB,
 MaxSize=200MB,
 FileGrowth=5mb --will grow by 5MB until you reach 200MB
 )
to filegroup ScheduleOverfow --add file to filegroup
/*
Create partition function
Create the table  in partition test
*/
/*
BEFORE YOU CREATE THE TABLE IN PARTITION TEST:
create partition function
create partition schema
*/
USE PartitionTest
--create partition function
--from Steve's blog
Create Partition Function Fx_ScheduleDate (dateTime)
As range left --left means the first value in the section (if it says right, it's the last value)
For values('20121231', '20131231','20141231', '20151231') --these are the dates, without slashes and year is first

--create partition schema
Create Partition scheme sch_Scheduleyear
As Partition fx_ScheduleYear
to (Schedule2012, Schedule2013, Schedule2014, Schedule2015, ScheduleOverfow)

--create a table that has the same structure as BusScheduleAssignment table on the schema
DROP TABLE [BusScheduleAssignment]
CREATE TABLE [dbo].[BusScheduleAssignment](
	[BusScheduleAssignmentKey] [int] IDENTITY(1,1) NOT NULL,
	[BusDriverShiftKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[BusRouteKey] [int] NULL,
	[BusScheduleAssignmentDate] [date] NOT NULL,
	[BusKey] [int] NULL,
	)on sch_Scheduleyear

--insert 
INSERT INTO BusScheduleAssignment(
[BusDriverShiftKey],
[EmployeeKey],
[BusRouteKey],
[BusScheduleAssignmentDate],
[BusKey]
)

--select
SELECT
[BusDriverShiftKey],
[EmployeeKey],
[BusRouteKey],
[BusScheduleAssignmentDate],
[BusKey]

FROM [dbo].[BusScheduleAssignment]
/*
DROP TABLE ServiceGrant
CREATE TABLE [dbo].[ServiceGrant](
	[GrantKey] [int] IDENTITY(1,1) NOT NULL,
	[GrantAmount] [money] NULL,
	[GrantDate] [datetime] NULL,
	[PersonKey] [int] NULL,
	[ServiceKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[GrantReviewDate] [date] NULL,
	[GrantApprovalStatus] [nvarchar](10) NULL,
	[GrantNeedExplanation] [nvarchar](max) NULL,
	[GrantAllocation] [money] NULL,
)on sch_GrantDate(GrantDate)

*/

--insert 
/*
INSERT INTO ServiceGrant(
 GrantAmount, GrantDate, 
PersonKey, ServiceKey, EmployeeKey, 
GrantReviewDate, GrantApprovalStatus, 
GrantNeedExplanation, GrantAllocation
)
SELECT 
GrantAmount, GrantDate, 
PersonKey, ServiceKey, EmployeeKey, 
GrantReviewDate, GrantApprovalStatus, 
GrantNeedExplanation, GrantAllocation

FROM CommunityAssist.dbo.ServiceGrant
*/
/*
SELECT * FROM ServiceGrant

SELECT * FROM ServiceGrant
WHERE $partition.Fx_GrantDate(GrantDate)=1
*/
/*

INSERT INTO ServiceGrant(
GrantAmount, GrantDate, 
PersonKey, ServiceKey, EmployeeKey, 
GrantReviewDate, GrantApprovalStatus, 
GrantNeedExplanation, GrantAllocation
)
VALUES (200,'7/7/2012', 1,1,1,null,null,'want money',null)
*/