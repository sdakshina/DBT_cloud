{{
    config(
        materialized='table'
    )
}}

select * from {{source('dev','dummy')}}