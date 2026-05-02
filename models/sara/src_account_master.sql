{{
    config(
        materialized ='view'
    )
}}
select account_id,ACCOUNT_HOLDER_NAME,
 account_type,
 account_status,
 branch_code,
 load_date,
current_timestamp() as dbt_load_Date 
  from {{source('dev','account_master_src')}}