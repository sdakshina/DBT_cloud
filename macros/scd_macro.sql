{%macro all_column()%}
{% set query %}
-- select listagg(col1,',') within group( order by col1) as col1
-- from (select '"'||column_name||'"' as col1
-- from INFORMATION_SCHEMA.COLUMNS where table_name='CUSTOMER_STG')
select listagg(COLUMN_NAME,',') within group( order by column_name)
from INFORMATION_SCHEMA.COLUMNS where table_name='CUSTOMER_STG'
{% endset %}
{%set temp=run_query(query)%}
{% if execute %}
    {% set col_string = temp.columns[0].values()[0] %}
    {% set col_string1=[col_string]%}
    {% set final = col_string.split(',') %}
    {{col_string1}}
    {{final}}
    {%for i in col_string1%}
        upper({{i}})
        {%if not loop.last%}
        ,
        {%endif%}
    {%endfor%}
{% else %}
    {% set col_string = '' %}
{% endif %}
{%endmacro%}