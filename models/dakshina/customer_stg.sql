{{
    config(materialized='table')
}}

select customer_id,first_name,last_name,email,phone,address,city,
country,created_at from japan.dev.customers
where customer_id is not null