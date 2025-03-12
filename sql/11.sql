/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */


SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT film_id, unnest(special_features) AS feature
    FROM film) sub
JOIN film_actor on sub.film_id=film_actor.film_id
JOIN actor on film_actor.actor_id=actor.actor_id
ORDER BY first_name || ' ' || last_name;
