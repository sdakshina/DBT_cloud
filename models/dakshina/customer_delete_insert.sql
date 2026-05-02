{{
    config(materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key='customer_id',
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
where to_char(SRC.created_at,'YYYY-MM-DD HH:MI:SS')> (select to_char(max(inserted_dt),'YYYY-MM-DD HH:MI:SS') from {{this}})
{%endif%}