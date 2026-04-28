{{
    config(
        materialized='table'
    )
}}

select * from {{ref('ephe_employee')}}