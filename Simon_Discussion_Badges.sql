USE group_rpg ;

DESCRIBE Badges ; 
SELECT * FROM Badges ;
DESCRIBE Users ; 
SELECT * FROM Users ; #last access date, reputation, views

#CLASS
SELECT 
Class, COUNT(DISTINCT(Id)) AS COUNT,
COUNT(DISTINCT(Id))/SUM(ID) AS Frequency
FROM Badges 
GROUP BY Class;

#NAME
SELECT Name AS BadgesName, COUNT(DISTINCT(Id)) AS COUNT
FROM Badges 
GROUP BY Name ORDER BY COUNT(DISTINCT(Id)) DESC
LIMIT 10;

#Badges named by Tags
SELECT Name AS BadgesName, COUNT(DISTINCT(Id)) AS COUNT
FROM Badges
WHERE (TagBased =  (SELECT TagBased  FROM Badges WHERE (Name = "stealth"))   )
GROUP BY Name ORDER BY  COUNT(DISTINCT(Id)) DESC
LIMIT 10;

SELECT min(CreationDate) FROM Users;

#Total Badges
SELECT 
UserId, DisplayName AS Name, COUNT(Badges.Name) AS Badges,
Reputation, Views AS UserViews, CreationDate 
FROM Badges 
JOIN Users ON Badges.UserId = Users.Id 
GROUP BY DisplayName
HAVING  Reputation > 10000
ORDER BY COUNT(Badges.Name) DESC
LIMIT 10;

#Everyones Tag-based Badges
SELECT 
DisplayName AS Name, Name AS BadgesName, COUNT(Badges.Name) AS Badges
FROM Badges 
JOIN Users ON Badges.UserId = Users.Id 
WHERE (TagBased =  (SELECT TagBased  FROM Badges WHERE (Name = "stealth"))   )
GROUP BY DisplayName, Name
ORDER BY Badges DESC, Reputation DESC
LIMIT 50;

#Class 1 Badges
SELECT
DisplayName AS Name,  COUNT((Badges.Name)) AS Class_1_Badges,
Reputation, Views AS UserViews
FROM Badges 
JOIN Users ON Badges.UserId = Users.Id 
WHERE (Class = 1)
GROUP BY DisplayName, Class, Name 
#HAVING COUNT(DISTINCT(Badges.Name)) > 5
ORDER BY COUNT((Badges.Name)) DESC 
LIMIT 10;
