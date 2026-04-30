{{
    config(materialized='table')
}}

select customer_id,first_name,last_name,email,phone,address,city,
country,gender,created_at,
md5(concat(customer_id,first_name,last_name,email,phone,address,city,country)) as MD5 
from {{source('DEV','customers')}}