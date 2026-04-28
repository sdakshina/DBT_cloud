{{
    config
    (
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['customer_id'],
        merge_update_columns=['Name','email','phone','address','INSERTED_DT']
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
src.created_at as INSERTED_DT
 from {{ref('customer_stg')}} as src