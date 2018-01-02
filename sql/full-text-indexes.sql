/*
ITC 226 Database Administration - Assignments - Full text Indexes
*/

USE MASTER
GO
CREATE DATABASE FullTextExample
GO 
ALTER DATABASE FullTextExample
ADD FILEGROUP FullTextCatalog
GO
--use the database
USE FullTextExample
GO
--create table
CREATE TABLE Test
(
    testID int identity (1,1) primary key, --primary key will be autogenerated
    TestText nvarchar (255)
)

--insert text into the table
go
Insert into Test(TestText)
Values('For test to be successful we must have a lot of text'),
('The test was not successful. sad face'),
('there is more than one test that can try a man'),
('Success is a relative term'),
('It is a rare man that is always successful'),
('The root of satisfaction is sad'),
('men want success')

INSERT INTO Test (TestText)
VALUES ('I see something blue'),
('I saw the something blue'),
('I have seen the blue bird'), 
('I have been seen by the universe')

INSERT INTO Test (TestText)
VALUES ('I go to work every day'),
('I went to work yesterday'),
('I was going to the ball when a werewolf crossed my path'),
('I would have gone to the club if Ricky Bobby was not there')

SELECT * FROM Test


--CREATE FULL TEXT CATALOG
Create FullText Catalog TestDescription
on Filegroup FullTextCatalog
go
--Create a full text index
Create FullText index on Test(TestText)
Key Index [PK__Test__A29BFBA836754A8B] --this is what a key autogenerated from the system looks like
on TestDescription
With Change_tracking auto
go

--find all instances that have the word "sad"
Select TestID, TestText 
From Test
Where FreeText(TestText, 'sad')

--find all instances that have the word "want"
Select TestID, TestText 
From Test
Where FreeText(TestText, 'men')

/*
--FROM STEVE'S BLOG
--do the same with successful
Select TestID, TestText 
From Test
Where FreeText(TestText, 'successful')

Select TestID, TestText 
From Test
Where Contains(TestText, '"success"')

Select TestID, TestText 
From Test
Where Contains(TestText, '"want"')

--look for any words containing the letters "success"
--the * is a wildcard
Select TestID, TestText 
From Test
Where Contains(TestText, '"success*"')

Select TestID, TestText 
From Test
Where Contains(TestText, '"want*"')
*/

--looks for all grammatical forms of a word
Select TestID, TestText 
From Test
Where Contains(TestText, ' Formsof (Inflectional, see)')

Select TestID, TestText 
From Test
Where Contains(TestText, ' Formsof (Inflectional, go)')

Select TestID, TestText 
From Test
Where Contains(TestText, ' Near ((man, successful),3)')

Select TestID, TestText 
From Test
Where Contains(TestText, ' Near ((man, successful), max)')

Select TestID, TestText 
From Test
Where Contains(TestText, 'Near ((work,day),max)')

SELECT * FROM Test
