/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
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
    SUM(revenue) OVER (ORDER BY rank) as "total revenue",
    TO_CHAR((SUM(revenue) OVER (ORDER BY rank))/SUM(revenue) OVER () * 100, 'FM900.00') AS "percent revenue"
FROM s1
ORDER BY rank;
