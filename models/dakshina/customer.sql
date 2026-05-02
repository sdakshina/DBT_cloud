{{
    config(materialized='view',
    pre_hook=["{{pre_hook_job_audit()}}"],
    post_hook=["{{post_hook_job_audit()}}"])
}}

select * from {{ref('customer_incremental')}}