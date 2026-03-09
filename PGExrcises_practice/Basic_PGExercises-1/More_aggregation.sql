SELECT firstname, surname, joindate  FROM cd.members
WHERE = (SELECT MAX(joindate) FROM cd.members)

