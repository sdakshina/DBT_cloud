{{
    config(materialized='incremental')    
}}

select 
customer_id,
concat(first_name,' ',last_name) as Name,
email,
phone,
address,
city,
country,
current_timestamp() as inserted_dt
 from {{ref('customer_stg')}} as src

 {%if is_incremental()%}
 where src.created_at > (select max(inserted_dt) from {{this}})
 {%endif%}