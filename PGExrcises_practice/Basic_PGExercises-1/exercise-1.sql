select facid, name , membercost, monthlymaintenance
From cd.facilities
where membercost < monthlymaintenance / 50 and membercost > 0