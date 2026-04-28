{{
config(
    materialized = 'ephemeral'
)
}}

select * from {{ref('stg_employee')}}
where salary <5000