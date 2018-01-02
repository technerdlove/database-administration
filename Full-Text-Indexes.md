# Here I create a full text index
* A full text index has some better algorithms for matching data and finding variations of names. Therefore, a full text index can provide better performance for matching Smith, Smythe, Smithers, etc when you look for Smith.
* In such cases a full text index provides better results compare to traditional like method.

## Steps
1. Create a new database with a file for a full text index
2. Add a table with some text
3. Create a full text index catalog
4. Run Queries on the full text catalog

## Outcome

```USE MASTER
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
```