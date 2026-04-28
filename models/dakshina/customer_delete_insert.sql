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
current_timestamp() as inserted_dt
 from {{ref('customer_stg')}} as src

{%if is_incremental()%}
where to_char(SRC.created_at,'YYYY-MM-DD HH:MM:SS')> (select to_char(max(inserted_dt),'YYYY-MM-DD HH:MM:SS') from {{this}})
{%endif%}