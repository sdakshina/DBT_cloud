{{
    config(materialized='view')
}}

select * from {{ref('customer_incremental')}}