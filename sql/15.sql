/*
 * Compute the total revenue for each film.
 */

SELECT f.title, COALESCE(SUM(amount),0.00) AS revenue
FROM film f
LEFT JOIN inventory on f.film_id=inventory.film_id
LEFT JOIN rental on inventory.inventory_id=rental.inventory_id
LEFT JOIN payment on rental.rental_id=payment.rental_id
GROUP BY f.film_id
ORDER BY revenue DESC, f.title ASC;

-- nulls are just throw in at the end
