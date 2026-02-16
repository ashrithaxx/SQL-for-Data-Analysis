CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY,
    title TEXT,
    genre TEXT,
    year INTEGER
);

INSERT INTO movies VALUES
(1, 'Inception', 'Sci-Fi', 2010),
(2, 'Titanic', 'Romance', 1997),
(3, 'The Dark Knight', 'Action', 2008),
(4, 'Interstellar', 'Sci-Fi', 2014),
(5, 'Avengers', 'Action', 2012);

-- Actors table
CREATE TABLE actors (
    actor_id INTEGER PRIMARY KEY,
    actor_name TEXT
);

INSERT INTO actors VALUES
(1, 'Leonardo DiCaprio'),
(2, 'Christian Bale'),
(3, 'Robert Downey Jr.'),
(4, 'Matthew McConaughey');

-- Movie Cast table
CREATE TABLE movie_cast (
    cast_id INTEGER PRIMARY KEY,
    movie_id INTEGER,
    actor_id INTEGER
);

INSERT INTO movie_cast VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 4),
(5, 5, 3);

-- Ratings table
CREATE TABLE ratings (
    rating_id INTEGER PRIMARY KEY,
    movie_id INTEGER,
    rating REAL
);

INSERT INTO ratings VALUES
(1, 1, 8.8),
(2, 2, 7.8),
(3, 3, 9.0),
(4, 4, 8.6),
(5, 5, 8.0);

SELECT * FROM movies;