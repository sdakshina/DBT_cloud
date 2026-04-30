{{config(
    materialized = 'table'
)
}}
select 
C_CUSTKEY, C_NAME, C_ADDRESS, C_NATIONKEY, C_PHONE, C_ACCTBAL, C_MKTSEGMENT, C_COMMENT, LOAD_DATE,
current_timestamp as dbt_load_date from japan.dev.SRC_CUSTOMERS
where load_date >= (select coalesce(max(load_date), '1900-12-31') from {{this}}) 


