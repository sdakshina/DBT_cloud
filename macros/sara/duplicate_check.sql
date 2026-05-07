{% macro duplicate_check(table, pks ) %}
    select {{pks}}, count(*)
    from {{ref(table)}}
    group by {{pks}}
    having count(*)
{% endmacro %}