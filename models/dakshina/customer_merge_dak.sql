{{
    config
    (
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['customer_id'],
        merge_update_columns=['Name','email','phone','address','INSERTED_DT'],
        pre_hook=["{{pre_hook_job_audit()}}"],
    post_hook=["{{post_hook_job_audit()}}"]
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