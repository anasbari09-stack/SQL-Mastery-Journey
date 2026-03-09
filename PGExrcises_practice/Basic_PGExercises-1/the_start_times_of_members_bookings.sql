SELECT b.starttime 
FROM cd.bookings as b
JOIN cd.members as m
ON b.memid = m.memid
WHERE firstname = 'David' and surname = 'Farrell'