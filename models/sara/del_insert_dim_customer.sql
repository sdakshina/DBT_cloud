{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'delete+insert',
        unique_key ='C_CUSTKEY'
    )
}}

select C_CUSTKEY, C_NAME, C_ADDRESS, C_NATIONKEY, C_PHONE, C_ACCTBAL, C_MKTSEGMENT, C_COMMENT, LOAD_DATE,
current_timestamp as dbt_load_date from {{ref('del_insert_customer')}}
{% if is_incremental()%}
where dbt_load_date >
(select coalesce(max(dbt_load_date),'1900-12-31') from {{this}})
{% endif %}