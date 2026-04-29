{{
    config
    (materialized='incremental',
    incremental_strategy='insert_overwrite',
    unique_key='employee_id'
    )
}}

select * from japan.dev.customers

{%if is_incremental()%}

where created_at>(select dateadd('day',-3,current_timestamp()))

{%endif%}