{{
    config(materialized='incremental',
    pre_hook=["{{pre_hook_job_audit()}}"],
    post_hook=["{{post_hook_job_audit()}}"])    
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