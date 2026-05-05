{{
    config(
        materialized= 'table')
}}
select  account_id,ACCOUNT_HOLDER_NAME,
 account_type,
 account_status, 
 branch_code,
 load_date,
 current_timestamp as dbt_load_date from {{ref('src_account_master')}}