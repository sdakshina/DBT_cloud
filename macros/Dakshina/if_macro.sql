--['INDIA','USA','UK']
-- sum(case when region='INDIA' then revenue end) as india_revenue,
-- sum(case when region='USA' then revenue end) as usa_revenue,
-- sum(case when region='UK' then revenue end) as uk_revenue.


{%macro if_macro()%}
{%set z=dbt_utils.get_column_values(table=source('DEV','SALES'), column='region')%}
{%for i in z%}
 sum(case when region='{{i}}' then revenue end) as {{i}}_revenue
{%if not loop.last%}
, 
{%endif%}
{%endfor%}
{%endmacro%}


