{{
    config
    (materialized='incremental',
    incremental_strategy='insert_overwrite',
    unique_key='employee_id',
    partition_by={'field':'created_at','data_type':'timestamp'}
    )
}}

select * from japan.dev.customers as src

{%if is_incremental()%}

where src.created_at>(select dateadd('day',-10,current_timestamp()))

{%endif%}