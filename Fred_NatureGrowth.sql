USE group_rpg;

### Birth_user_2019 ###
SELECT COUNT(CreationDate) FROM(
SELECT CreationDate FROM Users
WHERE CreationDate BETWEEN '2019.01.01 00:00:00' AND '2019.12.31 23:59:59'
) AS Birth_user_2019;

### Death_user_2019 ###
SELECT COUNT(LastAccessDate) FROM(
SELECT LastAccessDate FROM Users
WHERE LastAccessDate BETWEEN '2019.01.01 00:00:00' AND '2019.12.31 23:59:59'
) AS Death_user_2019;

### Birth_user_2020 ###
SELECT COUNT(CreationDate) FROM(
SELECT CreationDate FROM Users
WHERE CreationDate BETWEEN '2020.01.01 00:00:00' AND '2020.12.31 23:59:59'
) AS Birth_user_2020;

### Death_user_2020 ###
SELECT COUNT(LastAccessDate) FROM(
SELECT LastAccessDate FROM Users
WHERE LastAccessDate BETWEEN '2020.01.01 00:00:00' AND '2020.12.31 23:59:59'
) AS Death_user_2020;

### Birth_user_2021 ###
SELECT COUNT(CreationDate) FROM(
SELECT CreationDate FROM Users
WHERE CreationDate BETWEEN '2021.01.01 00:00:00' AND '2021.12.31 23:59:59'
) AS Birth_user_2021;

### Death_user_2021 ###
SELECT COUNT(LastAccessDate) FROM(
SELECT LastAccessDate FROM Users
WHERE LastAccessDate BETWEEN '2021.01.01 00:00:00' AND '2021.12.31 23:59:59'
) AS Death_user_2021;

### Birth_user_2022 ###
SELECT COUNT(CreationDate) FROM(
SELECT CreationDate FROM Users
WHERE CreationDate BETWEEN '2022.01.01 00:00:00' AND '2022.12.31 23:59:59'
) AS sub_PathFinder_2022;

### Death_user_2022 ###
SELECT COUNT(LastAccessDate) FROM(
SELECT LastAccessDate FROM Users
WHERE LastAccessDate BETWEEN '2022.01.01 00:00:00' AND '2022.12.31 23:59:59'
) AS Death_user_2022;

### Birth_user_2023 ###
SELECT COUNT(CreationDate) FROM(
SELECT CreationDate FROM Users
WHERE CreationDate BETWEEN '2023.01.01 00:00:00' AND '2023.12.31 23:59:59'
) AS Birth_user_2023;

### Death_user_2023 ###
SELECT COUNT(LastAccessDate) FROM(
SELECT LastAccessDate FROM Users
WHERE LastAccessDate BETWEEN '2023.01.01 00:00:00' AND '2023.12.31 23:59:59'
) AS Death_user_2023;
