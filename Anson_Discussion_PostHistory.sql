-- Select group_rpg database for group projec
USE group_rpg;
Show Tables;

--  Details of PostHistory
DESCRIBE PostHistory;
SELECT * from PostHistory;

-- The relationship between PostId and CreationDate fields
SELECT Id, PostHistoryTypeId, PostId, CreationDate, UserId, UserDisplayName, Comment, Text from PostHistory
Order by CreationDate;

SELECT * from PostHistory
WHERE PostHistoryTypeId = 3; -- Check the text is tag

-- The count of posts for each UserId
SELECT UserId, COUNT(UserId) as Post_counts_per_user from PostHistory
GROUP by UserId
ORDER by Post_counts_per_user DESC
limit 5;

SELECT * from PostHistory
WHERE UserId = -1; -- The text infotmation is not readible or empty
SELECT * from PostHistory
WHERE UserId = 321; -- Check the information of UserId 33569/321/22566/1204

-- The relationship between count of posts per user and Users table
Describe Users;
SELECT * from Users;

SELECT Id,Reputation, Views, CreationDate, DisplayName, LastAccessDate, Location from Users
Order by Reputation DESC
limit 10;

SELECT Id,Reputation, Views, CreationDate, DisplayName, LastAccessDate, Location from Users
Order by Views DESC
limit 10;

-- Seperate the count of posts for each UserId into two groups
SELECT UserId, COUNT(UserId) as Post_counts_per_user from PostHistory
Where PostHistoryTypeId > 3
GROUP by UserId
ORDER by Post_counts_per_user DESC
limit 5;

SELECT UserId, COUNT(UserId) as Post_counts_per_user from PostHistory
Where PostHistoryTypeId < 4
GROUP by UserId
ORDER by Post_counts_per_user DESC
limit 5;

SELECT Id,Reputation, Views, CreationDate, DisplayName, LastAccessDate, Location from Users
Order by Reputation DESC
limit 10;

-- Join two tables of Posthistory and Users
SELECT Users.Id, Users.DisplayName,COUNT(PostHistory.UserId) as Post_counts_per_user, Users.Views, Users.Reputation from Users
JOIN PostHistory
on Users.Id = PostHistory.UserId
Where PostHistory.PostHistoryTypeId = 2
GROUP by PostHistory.UserId
ORDER by Post_counts_per_user DESC
limit 11;