use sakila;

-- CapStone Project - Sprint 1 - Case Study on Sakila DataBase-

-- TASK 1

select concat(first_name," ",last_name) as actor_full_name from actor;
-- actors full is displayed

-- TASK 2
select first_name, count(*) as count from actor group by first_name;
-- No.of times each firstname appears

-- TASK 2.1
select first_name,  count(*) as count from actor group by first_name having count = 1;
-- Unique first name

-- TASK 3
select last_name, count(*) as count from actor group by first_name;
-- No.of times each lastname appears

-- TASK 3.1
select last_name,  count(*) as count from actor group by first_name having count = 1;
-- Unique last name

-- TASK 4
select title, rating from film where rating = "R";
-- "R" rated films

-- TASK 4.1
select title, rating from film where rating != "R";
-- Not "R" rated films

-- TASK 4.2
select title, rating from film where rating = "G" or rating = "PG-13" ;
-- "G", "PG-13" rated films

-- TASK 5
select title,replacement_cost from film where replacement_cost <="11";
-- list of movies where replacement_cost upto 11.

-- TASK 5.1
select title, replacement_cost from film where replacement_cost between "11" and "20";
-- list of movies where replacement_cost is between 11-20.

-- TASK 5.2
select title, replacement_cost from film order by replacement_cost desc;
-- list of all movies in descending order.

-- TASK 6
select film.title, count(*) as actor_count from film join film_actor on film.film_id = film_actor.film_id
group by film.title order by actor_count desc limit 3;
-- list of films where more no.of actors acted.

-- TASK 7
select title from film where title like "K%"  or title like "Q%";
-- Movie titles starting with letter "K" and "Q"

-- TASK 8
select title, concat(first_name, " ", last_name) as actor_names from actor join film_actor on actor.actor_id = film_actor.actor_id
join film on film.film_id = film_actor.film_id
 where film.title = "Agent Truman";
 -- list of actors acted in "Agent Truman"
 
 -- TASK 9
 select title, category.name from film join film_category on film.film_id = film_category.film_id
 join category  on film_category.category_id=category.category_id
 where category.name = "Family";
 -- "Family" category films
 
 -- TASK 10
select  rating, max(film.rental_rate) as maximum_rental_cost, min(film.rental_rate) as minimum_rental_cost,
 avg(film.rental_rate) as average_rental_cost from film group by film.rating;
 -- Rental cost details for films
 
 -- TASK 10.1

 select film.title, count(*) as rental_frequency from rental join inventory on rental.inventory_id = inventory.inventory_id
 join film on inventory.film_id = film.film_id group by film.title order by rental_frequency desc;
 -- rental frequency
 
 -- TASK 11
 select category.name, avg(film.replacement_cost) as avg_replacement_cost, avg(film.rental_rate) as avg_rental_rate from film
 join film_category on film.film_id = film_category.film_id join category on film_category.category_id = category.category_id
 group by category.name having avg_replacement_cost - avg_rental_rate > 15;
 -- list of films 
 
 
 -- TASK 12
 select category.name, count(*) as movie_count from film join film_category on film.film_id = film_category.film_id
  join category on film_category.category_id = category.category_id group by category.name having movie_count > 70;
  -- film category greater than 70
