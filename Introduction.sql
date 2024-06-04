SHOW databases;
USE group_rpg;

### finding first post ###
SELECT * FROM Posts
ORDER BY CreationDate DESC; 

### count how many posts are there so far ###
SELECT COUNT(CreationDate) FROM Posts;

### finding first user ###
SELECT * FROM Users
ORDER BY CreationDate DESC;

### count how many users are there so far ###
SELECT COUNT(Id) FROM Users;

### data for making worldclooud ###
SELECT Tags FROM Posts;
