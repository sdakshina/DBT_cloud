{{config(
    materialized = 'table'
)
}}
select * from {{source('dev','dummy')}}
where CREATED_TS >= (select coalesce(max(CREATED_TS), '1900-12-31') from {{source('dev','dummy')}}) 

