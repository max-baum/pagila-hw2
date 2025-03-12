/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */


SELECT
    EXTRACT (YEAR FROM rental_date) AS "Year",
    EXTRACT (MONTH FROM rental_date) AS "Month",
    SUM (amount) AS "Total Revenue"
FROM
    rental
JOIN payment on rental.rental_id=payment.rental_id
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date)
   )
ORDER BY EXTRACT(YEAR FROM rental_date), EXTRACT(MONTH FROM rental_date);
