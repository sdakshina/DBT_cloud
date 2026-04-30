{{
    config(
        materialized='incremental',
        incremental_strategy = 'insert_overwrite',
        unique_key = 'c_custkey',
        partition_by ={ 'field': 'LOAD_DATE', 'data_type':'timestamp'}
    )
}}
select C_CUSTKEY, C_NAME, C_ADDRESS, C_NATIONKEY, C_PHONE, C_ACCTBAL, C_MKTSEGMENT, C_COMMENT, LOAD_DATE,
current_timestamp as dbt_load_date from {{ref('del_insert_customer')}} src
{% if is_incremental() %}
where src.load_date >= dateadd(day,-3,current_timestamp)
{% endif %}