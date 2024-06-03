USE group_rpg;
SHOW TABLES;
-- observe Posts Table
DESCRIBE Posts ;
SELECT * FROM Posts p ;

-- observe Users Table
DESCRIBE Users ;
SELECT * FROM Users ;

-- observe Tags Table
DESCRIBE Tags  ;
SELECT * FROM Tags t 
ORDER BY COUNT DESC ;

-- select all the Users id, Displayname, and Location for dicussind every Country's User number
SELECT Id,
       DisplayName,
       Location 
FROM Users
WHERE Location IS NOT NULL AND Id > 0;

-- Join Users and Posts and select the user who has posted a post about the 8 games we choose 
-- dnd
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'dnd|dungeons-and-dragons'
GROUP BY Users.Id;

-- pathfinder
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'PathFinder'
GROUP BY Users.Id;

-- world-of-darkness
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'world-of-darkness'
GROUP BY Users.Id;

-- chronicles-of-darkness
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'chronicles-of-darkness'
GROUP BY Users.Id;

-- vampire-the-masquerade
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'vampire-the-masquerade'
GROUP BY Users.Id;

-- mutants-and-masterminds
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'mutants-and-masterminds'
GROUP BY Users.Id;

-- dungeon-world
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'dungeon-world'
GROUP BY Users.Id;

-- shadowrun
SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'shadowrun'
GROUP BY Users.Id;

