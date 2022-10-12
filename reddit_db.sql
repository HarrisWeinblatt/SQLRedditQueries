SQL Reddit Queries

/* Write a query to calculate the average score of all the posts for each subreddit */
SELECT subreddits.name,
AVG(posts.score) AS 'Average Score'
FROM subreddits
INNER JOIN posts
ON subreddits.id = posts.subreddit_id
GROUP BY subreddits.name
ORDER BY 2 DESC;

/* Write a query to find the highest score post for each subreddit and then order them by top score first */
 SELECT DISTINCT subreddits.name, posts.title,
 MAX(posts.score) AS 'Highest Subreddit Scores'
 FROM posts
 INNER JOIN subreddits
 ON subreddits.id = posts.subreddit_id
 GROUP BY 1
 ORDER BY MAX(posts.score) DESC;

/* Write a query to find the most popular posts with a score over 5000 */
WITH popular_posts AS (
SELECT *
FROM posts
WHERE score >= 5000 
)
SELECT subreddits.id, popular_posts.score,
popular_posts.title
FROM subreddits
INNER JOIN popular_posts
  ON subreddits.id = popular_posts.id
  ORDER BY popular_posts.score DESC;

/* write a query to show table posts and posts2 */
SELECT *
FROM posts;
SELECT *
FROM posts2;

/* Write a querry to show only posts from active users */
SELECT username AS "Active Users"
FROM posts
INNER JOIN users
  ON users.id = posts.user_id;

/* Combine tables users and posts to determine how many posts each user has made in descending order. */
SELECT users.username AS 'Username', COUNT(*) AS 'Amount of Posts Made'
FROM users
LEFT JOIN posts
  ON users.id = posts.user_id
GROUP BY users.id
ORDER BY 2 DESC;

/* What user has the highest score */
SELECT username AS 'User', score AS 'with highest Score'
FROM users
ORDER BY score DESC
LIMIT 1;

/* What post has the highest score*/
SELECT title AS 'Post', score AS 'with highest Score'
FROM posts
ORDER BY score DESC
LIMIT 1;


/* What are the top 5 subreddits with the highest subscriber_count*/
SELECT name AS 'SubReddit', subscriber_count AS 'with highest Subscriber Count'
FROM subreddits
ORDER BY subscriber_count DESC
LIMIT 5;


/* Number of subreddits */
SELECT COUNT(*) AS 'SubReddit Count'
FROM subreddits;


/* Take a look at all 3 tables: post, users and subreddits */
SELECT *
FROM posts
LIMIT 10;

SELECT *
FROM users
LIMIT 10;

SELECT *
FROM subreddits
LIMIT 10;
