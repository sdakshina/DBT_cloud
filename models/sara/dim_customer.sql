{{config(
    materialized='incremental',
    incremental_strategy = 'merge',
    unique_key = 'C_CUSTKEY'
)}}

select 
C_CUSTKEY,
C_NAME,
c.COUNTRY_CODE,
sc.COUNTRY_NAME full_name,
current_timestamp() as  load_date
from japan.dev.SRC_CUSTOMERS c
inner join 
{{ref('seed_country')}} sc 
on (c.COUNTRY_CODE= sc.COUNTRY_CODE)
{% if is_incremental() %} 
where load_date >
(select coalesce(max(load_date),'1900-12-31') from {{this}})
{% endif %}