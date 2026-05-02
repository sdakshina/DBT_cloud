{{
    config
    (
    materialized='table',
    pre_hook=["{{pre_hook_job_audit()}}"],
    post_hook=["{{post_hook_job_audit()}}"]
    )
}}

select customer_id,first_name,last_name,email,phone,address,city,
country,gender,created_at,
md5(concat(customer_id,first_name,last_name,email,phone,address,city,country)) as MD5 
from {{source('DEV','customers')}}