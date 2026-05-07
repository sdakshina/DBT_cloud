{% macro null_test(table, col_name)%}
    select {{col_name}} from {{ref(table)}}
    where {{col_name}} is not null
{% endmacro %}