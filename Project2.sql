# Business Opportunity 1
USE SocialMedia;

-- Finding the number of users that belong to each generation
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1946 AND YEAR(date_of_birth) <=1964; /* baby boomers */
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1965 AND YEAR(date_of_birth) <=1980; /* gen x */
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1981 AND YEAR(date_of_birth) <=1996; /* millenials */
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1997 AND YEAR(date_of_birth) <=2012; /* gen z */

-- Finding the number of users that belong to the Baby Boomer and Gen X generations
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1946 AND YEAR(date_of_birth) <=1964 UNION
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1965 AND YEAR(date_of_birth) <=1980; 

-- Finding the number of users that belong to the Millenial and Gen Z generations
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1981 AND YEAR(date_of_birth) <=1996 UNION
SELECT COUNT(*) FROM User WHERE YEAR(date_of_birth) >= 1997 AND YEAR(date_of_birth) <=2012; 

# Business Problem 2
-- Getting the usernames that are repeated
SELECT username, COUNT(username) FROM User GROUP BY username HAVING COUNT(username) > 1;

-- Identifying the users based on their usernames
SELECT * FROM User WHERE username="rjohnson" OR username="daniel18" OR username="mary57";

-- Constraint suggested to prevent repreated usernnames
ALTER TABLE User ADD CONSTRAINT user_names UNIQUE(username);

# Business Problem 3
-- Internal model proposal for likes tracker

CREATE TABLE Likes (
id INTEGER PRIMARY KEY,
liker_id INTEGER NOT NULL,
like_date DATETIME NOT NULL,
postauthor_id INTEGER NOT NULL,
author_id INTEGER NOT NULL,
FOREIGN KEY(liker_id) REFERENCES User(id),
FOREIGN KEY(post_id) REFERENCES Post(id),
FOREIGN KEY(postauthor_id) REFERENCES Post(author_id));
