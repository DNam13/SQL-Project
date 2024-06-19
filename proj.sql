1. /* To get emails of customers from store 2*/ 
SELECT * 
FROM sakila.customer
WHERE store_id = 2;

2. /* To get total number of active customers from stores */
SELECT store_id,
	   COUNT(store_id) AS TOT_ACT_CUST
FROM sakila.customer
WHERE active = 1
GROUP BY store_id;

3./* GET FULL NAMES OF ACTORS*/
SELECT *,
	   CONCAT(first_name," ",last_name) AS Name
FROM sakila.actor;


4./* To get titles of films of different actors*/
SELECT a.actor_id,
	   f.title,
	   CONCAT(a.first_name," ",a.last_name) AS name
FROM sakila.actor a 
JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
JOIN sakila.film f ON f.film_id = fa.film_id
ORDER BY name;

5. \* To get genre of actors *\
SELECT c.name AS genre,
		CONCAT(a.first_name," ",a.last_name) AS actor
FROM sakila.actor a 
JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
JOIN sakila.film_category fc ON fc.film_id = fa.film_id
JOIN sakila.category c ON c.category_id= fc.category_id;

6./*To get total films of an actor in a descending order*/
SELECT a.actor_id,
	   COUNT(f.film_id) AS total_films,
	   CONCAT(a.first_name," ",a.last_name) AS name
FROM sakila.actor a 
JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
JOIN sakila.film f ON f.film_id = fa.film_id
GROUP BY a.actor_id
ORDER BY total_films DESC;