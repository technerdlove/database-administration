# Database Administration
Administrative activities, security and backup on a Relational Database Management System, using administrative SQL and whatever tools the specific Relational Database Management System (RBMS) offers

## Outcomes
* Develop and implement a database monitoring plan
* Analyze monitored data
* Back up and recover data
* Plan and implement data integrity checks
* Plan and manage physical resource requirements
* Audit database systems
* Gather and document database security requirements
* Implement and enforce security requirements

---

## Database Administration Questions and Answers 

### List the major components of SQL server (things like data engine, etc).
* Data Storage
* Buffer management
* Concurrency and locking
* T-SQL
* SQL Native Client

### How do you copy or move a database?
#### Using the Copy Database Wizard
*	You can use the Copy Database Wizard to copy or move databases between servers or to upgrade a SQL Server database to a later version. 
#### Restoring a database backup
* To copy an entire database, you can use the BACKUP and RESTORE Transact-SQL statements. Typically, restoring a full backup of a database is used to copy the database from one computer to another for a variety of reasons

### Why would you partition a table?
* You can transfer or access subsets of data quickly and efficiently, while maintaining the integrity of a data collection. For example, an operation such as loading data from an OLTP to an OLAP system takes only seconds, instead of the minutes and hours the operation takes when the data is not partitioned.

* You can perform maintenance operations on one or more partitions more quickly. The operations are more efficient because they target only these data subsets, instead of the whole table. For example, you can choose to compress data in one or more partitions or rebuild one or more partitions of an index.

* You may improve query performance, based on the types of queries you frequently run and on your hardware configuration. For example, the query optimizer can process equi-join queries between two or more partitioned tables faster when the partitioning columns in the tables are the same, because the partitions themselves can be joined.

* When SQL Server performs data sorting for I/O operations, it sorts the data first by partition. SQL Server accesses one drive at a time, and this might reduce performance. To improve data sorting performance, stripe the data files of your partitions across more than one disk by setting up a RAID. In this way, although SQL Server still sorts data by partition, it can access all the drives of each partition at the same time.

* In addition, you can improve performance by enabling lock escalation at the partition level instead of a whole table. This can reduce lock contention on the table.

### What would be a good backup strategy for a small business database (say a cafe or bookstore) and why?
* Use the BACKUP and RESTORE, and perform a Full Backup.  It’s the simplest type of backup, and it’s necessary prior to other backup types.  

### What does it means to administer a database? What are some of the main areas of concern for administrator? List at least 5 database tasks that an administrator is likely to perform.

*	Installation, configuration and upgrading of Database server software and related products.
*	Evaluate Database features and Database related products.
*	Establish and maintain sound backup and recovery policies and procedures.
*	Take care of the Database design and implementation.
*	Implement and maintain database security (create and maintain users and roles, assign privileges).
*	Database tuning and performance monitoring.
*	Application tuning and performance monitoring.
*	Setup and maintain documentation and standards.
*	Plan growth and changes (capacity planning).
*	Work as part of a team and provide 24x7 support when required.
*	Do general technical troubleshooting and give cons.
*	Database recovery.

#### There are three types of DBAs:
1. Systems DBAs (also referred to as Physical DBAs, Operations DBAs or Production Support DBAs): focus on the physical aspects of database administration such as DBMS installation, configuration, patching, upgrades, backups, restores, refreshes, performance optimization, maintenance and disaster recovery.

2. Development DBAs: focus on the logical and development aspects of database administration such as data model design and maintenance, DDL (data definition language) generation, SQL writing and tuning, coding stored procedures, collaborating with developers to help choose the most appropriate DBMS feature/functionality and other pre-production activities.

3. Application DBAs: usually found in organizations that have purchased 3rd party application software such as ERP (enterprise resource planning) and CRM (customer relationship management) systems. Examples of such application software includes Oracle Applications, Siebel and PeopleSoft (both now part of Oracle Corp.) and SAP. Application DBAs straddle the fence between the DBMS and the application software and are responsible for ensuring that the application is fully optimized for the database and vice versa. They usually manage all the application components that interact with the database and carry out activities such as application installation and patching, application upgrades, database cloning, building and running data cleanup routines, data load process management, etc.




