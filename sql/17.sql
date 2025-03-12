/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */


WITH s1 AS(
SELECT RANK() OVER (ORDER BY COALESCE(SUM(amount),0) DESC) AS "rank", f.title, COALESCE(SUM(amount),0.00) AS revenue
FROM film f
LEFT JOIN inventory on f.film_id=inventory.film_id
LEFT JOIN rental on inventory.inventory_id=rental.inventory_id
LEFT JOIN payment on rental.rental_id=payment.rental_id
GROUP BY f.film_id
ORDER BY revenue DESC, f.title ASC
)
SELECT 
    rank,
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY rank) as "total revenue"
FROM s1;
