{% macro region_macro(schema, table_name)  %}
    {% set code %}
        select distinct region from {{source(schema,table_name)}}
    {% endset %}
    {% set result = run_query(code) %}
    {% if execute %}
        {% set region_lst = result.columns[0].values()%}
    {% else %}
        {% set region_lst = [] %}
    {% endif %}
    select 
    {% for region in region_lst %}
        sum( case when region = '{{region}}'  then amount else 0 end ) as "col_{{region}}"
        {% if not loop.last %} , {% endif %} 
    {% endfor %}
     from {{source(schema,table_name)}}
{% endmacro %} 