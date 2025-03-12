/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */


SELECT f1.title
FROM film f1
INNER JOIN film f2
    ON f1.title=f2.title
WHERE EXISTS (
        SELECT 1
        FROM unnest(f1.special_features) AS feature
        WHERE feature = 'Trailers'
    )
AND EXISTS (
        SELECT 1
        FROM unnest(f2.special_features) AS feature
        WHERE feature = 'Behind the Scenes'
    )
ORDER BY f1.title;
