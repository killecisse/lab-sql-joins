-- List the number of films per category
SELECT 
    category.name AS category,
    COUNT(film.film_id) AS num_films
FROM 
    category
JOIN 
    film_category ON category.category_id = film_category.category_id
JOIN 
    film ON film_category.film_id = film.film_id
GROUP BY 
    category.name;

-- Retrieve the store ID, city, and country for each store
SELECT 
    store.store_id,
    address.city,
    country.country
FROM 
    store
JOIN 
    address ON store.address_id = address.address_id
JOIN 
    city ON address.city_id = city.city_id
JOIN 
    country ON city.country_id = country.country_id;

-- Calculate the total revenue generated by each store in dollars
SELECT 
    store.store_id,
    SUM(payment.amount) AS total_revenue
FROM 
    payment
JOIN 
    rental ON payment.rental_id = rental.rental_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    store ON inventory.store_id = store.store_id
GROUP BY 
    store.store_id;

-- Determine the average running time of films for each category
SELECT 
    category.name AS category,
    AVG(film.length) AS average_running_time
FROM 
    category
JOIN 
    film_category ON category.category_id = film_category.category_id
JOIN 
    film ON film_category.film_id = film.film_id
GROUP BY 
    category.name;