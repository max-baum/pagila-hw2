/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT film.title
FROM rental
JOIN inventory on rental.inventory_id=inventory.inventory_id
JOIN film on inventory.film_id=film.film_id
WHERE customer_id=1
GROUP BY film.title
HAVING COUNT(film.film_id) > 1;
