-- Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name.--

select * , character_length(first_name)as count_char, character_length(last_name)as count_char from actor 
limit 10



-- List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.--


select * , character_length(first_name)as count_char, character_length(last_name)as count_char from actor_award
where awards= 'oscar'



-- Find the actors who have acted in the film ‘Frost Head’--

select * from actor  a
inner join film_actor f
on a.actor_id=f.actor_id
inner join film m
on m.film_id=f.film_id
where title= 'frost head'



-- Pull all the films acted by the actor ‘Will Wilson--


select * from film_actor f
inner join actor a 
on f.actor_id=a.actor_id
where first_name= 'will'



-- Pull all the films with ‘Comedy’ category--

select * from category c
inner join film_category f
on c.category_id=f.category_id
where name = 'comedy'



-- Pull all the films which were rented and return in the month of May.--

select * from rental r
inner join inventory i
on r.inventory_id=i.inventory_id
inner join film f 
on i.film_id=f.film_id
where month(rental_date)= 5







