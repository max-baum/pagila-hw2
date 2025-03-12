/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT film.title
FROM inventory
LEFT JOIN film on inventory.film_id=film.film_id
LEFT JOIN rental ON inventory.inventory_id=rental.inventory_id
LEFT JOIN customer ON rental.customer_id=customer.customer_id
LEFT JOIN address ON customer.address_id=address.address_id
LEFT JOIN city ON address.city_id=city.city_id
LEFT JOIN country ON city.country_id=country.country_id
GROUP BY film.title
HAVING COUNT(CASE WHEN country = 'United States' THEN 1 END) = 0
ORDER BY film.title;


