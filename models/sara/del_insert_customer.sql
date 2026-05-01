{{config(
    materialized = 'table'
)
}}
select * from {{source('dev','SRC_BANK_TRANSACTIONS')}}
where CREATED_TS >= (select coalesce(max(CREATED_TS), '1900-12-31') from {{source('dev','SRC_BANK_TRANSACTIONS')}}) 

