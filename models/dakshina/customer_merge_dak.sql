{{
    config
    (
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['customer_id'],
        merge_update_columns=['Name','email','phone','address']
    )
}}

select 
customer_id,
concat(first_name,' ',last_name) as Name,
email,
phone,
address,
city,
country,
created_at
 from {{ref('customer_stg')}} as src