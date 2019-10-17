-- Did you know you can make multiple CTEs? Here's the syntax
WITH <name> AS (Query)
, <name> AS (Query)
, <name> AS (Query)
SELECT ....


-- Get all actors that have been in the same films as the most popular actor
-- OPTION: Try to get it all in one go, or do this in steps (see HINTS on the repo)

WITH popular_actor AS(SELECT actor_id, COUNT(DISTINCT(film_id)) AS number_of_film
FROM film_actor
GROUP BY
actor_id
ORDER BY
number_of_film DESC
Limit 1),
popular_actor_film AS (SELECT p.actor_id, f.film_id 
FROM popular_actor AS p
JOIN
film_actor as f
ON
f.actor_id = p.actor_id)
SELECT DISTINCT(f.actor_id) 
FROM film_actor AS f
JOIN 
popular_actor_film as pf 
ON
f.film_id = pf.film_id
ORDER BY
f.actor_id;