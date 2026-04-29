{{
    config
    (materialized='view')
}}

select * from {{ref('employees')}}