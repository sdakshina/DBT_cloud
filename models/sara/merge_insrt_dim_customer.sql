{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = 'C_CUSTKEY'
    )
}}
select
C_CUSTKEY,
C_NAME,
C_ADDRESS,
C_NATIONKEY,
C_PHONE,
C_ACCTBAL,
C_MKTSEGMENT,
C_COMMENT,
LOAD_DATE,
current_timestamp() DBT_LOAD_DATE
from {{ref('del_insert_customer')}}
{% if is_incremental()%}
where dbt_load_date >
(select coalesce(max(DBT_LOAD_DATE),'1900-12-31') from {{this}})
{% endif %}