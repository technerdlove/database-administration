# Here I accomplish the following to for indexes and query optimizaton:
* Creation of indexes
* Execution plan and statistics
* Forced index query
* Running Tuning advisor

## Steps to complete:
1. Run the query with the actual execution plan and the statistics.
2. Add indexes to the underlying tables on key terms
3. Run after each change to compare the results

## Query to optimize:
```select [EmployeeLastName]
,[EmployeeFirstName]
,[BusRouteKey]
,[BusDriverShiftKey]
,[BusScheduleAssignmentDate]
,b.[BusKey]
,[BusTypeDescription]
,[Riders]
From Employee e
inner join BusScheduleAssignment bsa
on e.EmployeeKey=bsa.EmployeeKey
inner join Ridership r
on r.BusScheduleAssigmentKey=bsa.BusScheduleAssignmentKey
inner join Bus b
on b.BusKey=bsa.BusKey
inner join BusType bt
on b.BusTypekey=bt.BusTypeKey
where busrouteKey = 45
and year(busScheduleAssignmentDate)=2014
and month (busScheduleAssignmentDate)=6
order by [BusScheduleAssignmentDate]
,BusDriverShiftKey
,EmployeeLastName
```
## Result
![Indexes and Query Optimization](/images/Indexes-and-Query-Optimization/indexes-and-query-optimization.png)
