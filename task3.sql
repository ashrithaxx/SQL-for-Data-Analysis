-- Show all movies
SELECT * FROM movies;

-- Movies released after 2005
SELECT title, year
FROM movies
WHERE year > 2005;

-- Movies sorted by year (latest first)
SELECT title, year
FROM movies
ORDER BY year DESC;

-- Number of movies per genre
SELECT genre, COUNT(*) AS total_movies
FROM movies
GROUP BY genre;

-- INNER JOIN: movies with ratings
SELECT m.title, r.rating
FROM movies m
INNER JOIN ratings r
ON m.movie_id = r.movie_id;

-- LEFT JOIN: all movies with actors
SELECT m.title, a.actor_name
FROM movies m
LEFT JOIN movie_cast mc
ON m.movie_id = mc.movie_id
LEFT JOIN actors a
ON mc.actor_id = a.actor_id;

-- Movies with rating above average
SELECT title
FROM movies
WHERE movie_id IN (
    SELECT movie_id
    FROM ratings
    WHERE rating > (
        SELECT AVG(rating) FROM ratings
    )
);

-- Average movie rating
SELECT AVG(rating) AS average_rating
FROM ratings;

-- Highest rated movie
SELECT m.title, r.rating
FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id
ORDER BY r.rating DESC
LIMIT 1;

-- Movie rating summary view
DROP VIEW IF EXISTS movie_summary;

CREATE VIEW movie_summary AS
SELECT 
    m.title,
    m.genre,
    m.year,
    r.rating
FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id;

-- View the summary
SELECT * FROM movie_summary;

-- Create index for optimization
CREATE INDEX IF NOT EXISTS idx_movie_id
ON ratings(movie_id);