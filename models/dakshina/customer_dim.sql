{{
    config(materialized='table')    
}}

select 
customer_id,
concat(first_name,' ',last_name) as Name,
email,
phone,
address,
city,
country,
current_timestamp() as created_at
 from {{ref('customer_stg')}}