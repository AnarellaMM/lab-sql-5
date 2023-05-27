use sakila;

-- 1.Drop column picture from staff.
alter table staff
drop column picture;

select * from staff;

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff (staff_id, first_name, last_name, active, username)
VALUES (3, 'Tammy', 'Sanders', 'Tammy');

select staff_id, first_name, last_name from staff;
----
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
values (3,'Tammy', 'Sanders', 79, 'Tammy.Sanders@sakilastaff.com', 2, 1, 'Tammy');

select * from staff;

-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- you can use current date for the rental_date column in the rental table. Hint: Check the columns 
-- in the table rental and see what information you would need to add there. You can query those pieces of 
-- information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.


select * from rental;

select rental_date from rental;

select max(rental_id)+1 from rental;
   -- 16050
select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; 
 -- customer id 130
 

select inventory_id from sakila.inventory
where film_id = (select film_id from sakila.film where title = 'Academy dinosaur') and store_id = '1';

-- inventory_id 1, 2, 3, 4 four possibilities

select film_id from sakila.film 
where title = 'Academy dinosaur';
  -- film id 1

INSERT INTO rental (rental_id, rental_date, inventory_id ,customer_id, return_date, staff_id, last_update)
VALUES (16050, now(), 1, 130, null, 1, now());

select * from rental
order by rental_id desc
LIMIT 10;


-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer

select * from customer
where active !=1; 

create table backup_inactive_customers
select customer_id, email, now() from customer 
where active = 0;

delete from customer
where active !=1; 


