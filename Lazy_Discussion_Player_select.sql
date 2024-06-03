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
