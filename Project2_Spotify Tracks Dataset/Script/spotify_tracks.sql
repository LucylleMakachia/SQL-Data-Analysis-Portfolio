CREATE SCHEMA `spotify` ;
use spotify;

SET GLOBAL max_allowed_packet = 1073741824;

-- Explore the dataset
SELECT *
FROM `spotify tracks`
LIMIT 10;

-- List column information
DESCRIBE `spotify tracks`;

-- Count total records
SELECT COUNT(*) FROM `spotify tracks`;

-- Query: Explore most popular tracks
SELECT track_name, artists, popularity 
FROM `spotify tracks` 
ORDER BY popularity DESC 
LIMIT 10;

-- Query: Explore tracks longer 5 minutes
SELECT artists, track_name, ROUND(duration_ms/60000, 2) AS minutes
FROM `spotify tracks`
WHERE ROUND(duration_ms/60000, 2) > 5;

-- Query: Explore most popular genre
SELECT track_genre, AVG(popularity) AS avg_popularity 
FROM `spotify tracks`
GROUP BY track_genre
ORDER BY avg_popularity DESC 
LIMIT 1;

-- Query: Explore the distinct genres
SELECT DISTINCT track_genre
FROM `spotify tracks`;

-- Query: Explore longest song per genre
SELECT artists, track_name, track_genre, ROUND(duration_ms / 60000, 2) AS minutes
FROM `spotify tracks` AS a
WHERE ROUND(duration_ms / 60000, 2) = (
    SELECT ROUND(MAX(duration_ms) / 60000, 2)
    FROM `spotify tracks` AS b
    WHERE b.track_genre = a.track_genre
)
ORDER BY minutes DESC
LIMIT 5;

