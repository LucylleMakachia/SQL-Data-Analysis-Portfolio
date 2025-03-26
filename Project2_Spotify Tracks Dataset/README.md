# Spotify Tracks Database Project
This project involves the exploration and analysis of a dataset containing Spotify track information. The database schema and queries help uncover insights such as the most popular tracks, longest songs, and genre trends.

## Database Setup
Schema Creation:
Database name: spotify.

Configuration:
max_allowed_packet set to handle large datasets efficiently.

## Exploration and Analysis
### Initial Dataset Examination:

Fetch the first 10 rows to inspect the dataset:
sql
SELECT * FROM `spotify tracks` LIMIT 10;

### Column Information:
Retrieve metadata about the dataset structure:
sql
DESCRIBE `spotify tracks`;

Count Total Records:
Determine the number of rows in the dataset:
sql
SELECT COUNT(*) FROM `spotify tracks`;

## Key Insights Through Queries
Most Popular Tracks:
List the 10 tracks with the highest popularity:
sql
  SELECT track_name, artists, popularity
  FROM `spotify tracks`
  ORDER BY popularity DESC
  LIMIT 10;

Tracks Longer Than 5 Minutes:
Find tracks with a duration exceeding 5 minutes:
sql
  SELECT artists, track_name, ROUND(duration_ms / 60000, 2) AS minutes
  FROM `spotify tracks`
  WHERE ROUND(duration_ms / 60000, 2) > 5;

Most Popular Genre:
Identify the genre with the highest average popularity:
sql
  SELECT track_genre, AVG(popularity) AS avg_popularity
  FROM `spotify tracks`
  GROUP BY track_genre
  ORDER BY avg_popularity DESC
  LIMIT 1;

Distinct Genres:
List all unique track genres in the dataset:
sql
  SELECT DISTINCT track_genre
  FROM `spotify tracks`;

Longest Songs Per Genre:
Find the longest track for each genre:
sql
SELECT artists, track_name, track_genre, ROUND(duration_ms / 60000, 2) AS minutes
FROM `spotify tracks` AS a
WHERE ROUND(duration_ms / 60000, 2) = (
    SELECT ROUND(MAX(duration_ms) / 60000, 2)
    FROM `spotify tracks` AS b
    WHERE b.track_genre = a.track_genre
)
ORDER BY minutes DESC
LIMIT 5;

## Usage
Use the provided queries to explore and derive insights from the Spotify dataset.
This project highlights database querying techniques and data exploration capabilities with MySQL.
