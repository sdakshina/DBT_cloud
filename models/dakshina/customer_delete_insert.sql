{{
    config(materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key='customer_id')
}}

select 
customer_id,
concat(first_name,' ',last_name) as Name,
email,
phone,
address,
city,
country,
CREATED_AT,
current_timestamp() as inserted_dt
 from {{ref('customer_stg')}} 


 {%if is_incremental()%}
  where created_at> (select max(created_at) from {{this}})
  {%endif%}